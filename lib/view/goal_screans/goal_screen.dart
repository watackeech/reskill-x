import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:reskill_x/component/main_button.dart';
import 'package:reskill_x/component/number_scroll.dart';
import 'package:reskill_x/constant/colors.dart';
import 'package:reskill_x/model/weekly_plan.dart';
import 'package:reskill_x/view/goal_screans/study_record_screen.dart';
import 'package:reskill_x/view/screen_control.dart';

import '../../component/alert_dialog.dart';
import '../../model/account.dart';
import '../../utils/authentication.dart';
import '../../utils/firestore/weekly_plan_firestore.dart';
import '../home_screen.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  static const String route = '/goal/goal_screen';

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  Account myAccount = Authentication.myAccount!;
  int _selecthour = 0;
  int _selectminute=0;

  // WeeklyPlan _weeklyPlan = WeeklyPlan(accountId: 'tanaka@gmail.com', hour: 1, );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("目標画面"),
        // ),
        body: SizedBox(
          height: size.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height * 0.38,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '目標時間を設定してください',
                      style: const TextStyle(
                        color: kBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ロウを中央寄せにす
                          children: [
                            NumberPicker(
                                //時
                                value: _selecthour,
                                minValue: 0,
                                maxValue: 24,
                                onChanged: (value) =>
                                    setState(() => _selecthour = value)),
                            Text(
                              '時間',
                              style: const TextStyle(
                                color: kBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            NumberPicker(
                                //分
                                value: _selectminute,
                                minValue: 0,
                                maxValue: 45,
                                step: 15,
                                onChanged: (value) =>
                                    setState(() => _selectminute = value)),
                            Text(
                              '分',
                              style: const TextStyle(
                                color: kBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ]),
                    ),
                    MainButton(
                      buttonColor: kPrime,
                      buttonTitle: '目標確定',
                      onTapped: () {
                        showDialog<void>(
                            context: context,
                            builder: (_) {
                              return AlertDialogComponent(
                                title: '週間目標時間',
                                hour: _selecthour,
                                minute: _selectminute,
                                onTapped: () async {
                                  WeeklyPlan newWeeklyPlan = WeeklyPlan(
                                      accountId: myAccount.id,
                                      targetHour: _selecthour,
                                      targetMinute: _selectminute
                                  );
                                  var result = await WeeklyPlanFirestore.addWeeklyPlan(newWeeklyPlan);
                                  if(result == true) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenControl()));
                                  }
                                },
                              );
                            });
                      },
                      textStyle: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      minWidth: 110,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
