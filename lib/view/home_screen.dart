import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:reskill_x/component/avatar_image.dart';
import 'package:reskill_x/component/due_date.dart';
import 'package:reskill_x/component/main_button.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Account myAccount = Authentication.myAccount!;
  Account buddyAccount = Authentication.buddyAccount!;


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showPopupBasedOnStatus(context));
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("目標期日まで"),
            const SizedBox(
              height: 10,
            ),
            DueDate(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AvatarImage(
                        userAvatarUrl: myAccount.imagePath,
                        radius: 0.2,
                        gradeColor: kBronze),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AvatarImage(
                        userAvatarUrl: buddyAccount.imagePath,
                        radius: 0.2,
                        gradeColor: kBronze),
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
                MaterialPageRoute(builder: (context) => SetGoalFormScreen()));
          });
        },
      );
    } else if (pattern == 2&& done == 'no') {
      mainMessage = '2週目が始まりました。新たに週間学習計画を設定しましょう。';
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
      mainMessage = '一か月お疲れさまでした。月間レポートを確認し、バディと振り返り面談をしましょう。';
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return displayPopup(mainMessage, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WeeklyReportScreen()));
          });
        },
      );
    } else {
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
