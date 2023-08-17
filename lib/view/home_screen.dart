import 'dart:ffi';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:reskill_x/component/avatar_image.dart';
import 'package:reskill_x/component/due_date.dart';
import 'package:reskill_x/component/main_button.dart';
import 'package:reskill_x/component/memo_button.dart';
import 'package:reskill_x/utils/firestore/user_firestore.dart';
import 'package:reskill_x/utils/firestore/weekly_plan_firestore.dart';
import 'package:reskill_x/view/goal_screans/goal_screen.dart';
import 'package:reskill_x/view/set_goal_form_screen.dart';
import 'package:reskill_x/view/weekly_report_screen.dart';

import '../component/alert_dialog.dart';
import '../component/circular_progress_bar.dart';
import '../component/point_icon.dart';
import '../constant/colors.dart';
import '../model/account.dart';
import '../utils/authentication.dart';

import '../main.dart';
import 'form_screens/set_goal_form_screens/set_goal_form_screen1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Account myAccount = Authentication.myAccount!;
  Account buddyAccount = Authentication.buddyAccount!;

  int currentWeek(int pattern ){
    print('pattern');
    print(pattern);
    if(pattern == 0 || pattern == 1 || pattern == 3){
      return 1;
    }
    else if(pattern == 2){
      return 2;
    }
    else if(pattern == 4){
      return 4;
    }
    else{
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showPopupBasedOnStatus(context));
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            const Text("目標期日まで", style: TextStyle(fontSize: 15,)),
            const SizedBox(
              height: 10,
            ),
            DueDate(),
            ProgressIcons(currentWeek(pattern)),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        AvatarImage(
                            userAvatarUrl: myAccount.imagePath,
                            radius: 0.2,
                            exp: myAccount.exp,
                        avatarTitle: 'あなた',),
                        Text(myAccount.name, style: TextStyle(fontSize: 25,)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        AvatarImage(
                            userAvatarUrl: buddyAccount.imagePath,
                            radius: 0.2,
                          exp: buddyAccount.exp,
                          avatarTitle: 'バディ',),
                        Text(buddyAccount.name, style: TextStyle(fontSize: 25,)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FutureBuilder(
                    future:
                        WeeklyPlanFirestore.getWeeklyPlansFromIds(myAccount.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.data.isNotEmpty) {
                        List<Map<String, dynamic>> weeklyPlanList =
                            snapshot.data;
                        return CircularProgressBar(
                            targetHour:
                                weeklyPlanList[0]['target_hour'].round(),
                            targetMinute:
                                weeklyPlanList[0]['target_minute'].round(),
                            currentHour:
                                weeklyPlanList[0]['current_hour'].round(),
                            currentMinute:
                                weeklyPlanList[0]['current_minute'].round());
                      } else {
                        //まだ学習計画を立てていなかったとき
                        return CircularProgressBar(
                            targetHour: 0,
                            targetMinute: 0,
                            currentHour: 0,
                            currentMinute: 0);
                      }
                    }),
                FutureBuilder(
                    future: WeeklyPlanFirestore.getWeeklyPlansFromIds(
                        buddyAccount.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.data.isNotEmpty) {
                        List<Map<String, dynamic>> weeklyPlanList =
                            snapshot.data;
                        return CircularProgressBar(
                            targetHour:
                                weeklyPlanList[0]['target_hour'].round(),
                            targetMinute:
                                weeklyPlanList[0]['target_minute'].round(),
                            currentHour:
                                weeklyPlanList[0]['current_hour'].round(),
                            currentMinute:
                                weeklyPlanList[0]['current_minute'].round());
                      } else {
                        return CircularProgressBar(
                            targetHour: 0,
                            targetMinute: 0,
                            currentHour: 0,
                            currentMinute: 0);
                      }
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showPopupBasedOnStatus(BuildContext context) async {
    String mainMessage;
    DateTime now = DateTime.now();
    int currentMonth = now.month;

    if (pattern == 1&& done == 'no') {
      mainMessage = '$currentMonth月になりました。新たに月間目標を設定しましょう。';
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return displayPopup(
              mainMessage, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SetGoalFormScreen1()));
          });
        },
      );
    } else if (pattern == 2&& done == 'no') {
      mainMessage = '新しい1週間が始まりました。新たに週間学習計画を設定しましょう。';
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return displayPopup(mainMessage, () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => GoalScreen()));
          });
        },
      );
    } else if (pattern == 3&& done == 'no') {
      mainMessage = '週間学習計画の期日になりました。週間レポートを確認しましょう。';
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return displayPopup(mainMessage, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WeeklyReportScreen()));
          });
        },
      );
    } else if (pattern == 4&& done == 'no') {
      mainMessage = '一か月お疲れさまでした。月間レポートを確認し、バディと中間報告面談をしましょう。';
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return displayPopup(mainMessage, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WeeklyReportScreen()));
          });
        },
      );
    } else if (pattern == 5 && done == 'no') {
      mainMessage = '二か月お疲れさまでした。月間レポートを確認し、バディと振り返り面談をしましょう。';
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return displayPopup(mainMessage, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WeeklyReportScreen()));
          });
        },
      );
    }
    else {
      return null;
    }
  }

  Widget displayPopup(String mainMessage, VoidCallback onTapped) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // 角を丸めるための値を指定
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min, // コンテンツのサイズを最小に設定
          children: <Widget>[

            Text(
              mainMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: kBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // 適宜スペースを追加
            MainButton(
              buttonColor: kPrime,
              buttonTitle: '確認',
              onTapped: onTapped,
              textStyle: TextStyle(
                color: kWhite,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              minWidth: 110,
            ),
          ],
       )
    );
  }
}

Widget ProgressIcons(int currentWeek){

  Color getColorBasedOnCondition(int week){
    if(week <= currentWeek){
      return kPrime;
    }
    else{
      return kLightGrey;
    }
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for(int i = 1; i <= 4; i++)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 30,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                color: getColorBasedOnCondition(i),
            )
          ),
        ),

    ],
  );


}
