import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:reskill_x/component/main_button.dart';
import 'package:reskill_x/component/number_scroll.dart';
import 'package:reskill_x/constant/colors.dart';
import 'package:reskill_x/model/weekly_plan.dart';
import 'package:reskill_x/view/screen_control.dart';

import '../../model/account.dart';
import '../../utils/authentication.dart';
import '../../utils/firestore/weekly_plan_firestore.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  Account myAccount = Authentication.myAccount!;
  int _selectedHour = 1;
  // WeeklyPlan _weeklyPlan = WeeklyPlan(accountId: 'tanaka@gmail.com', hour: 1, );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("目標画面"),
      ),
      body: Center(
        child:
          Column(
            children: [
              // NumberScroll(
              //     upperText: '目標時間を設定してください',
              //     buttonText: '目標確定',
              //     onPressed: (int selectedHour) async {
              //       print('Firebase処理に入ります。');
              //       WeeklyPlan newWeeklyPlan = WeeklyPlan(
              //           accountId: myAccount.userId,
              //           hour: selectedHour
              //       );
              //       var result = await WeeklyPlanFirestore.addWeeklyPlan(newWeeklyPlan);
              //       if(result == true) {
              //         Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenControl()));
              //       }
              //     },
              // ),
              NumberPicker(
                //数字選択するやつ
                value: _selectedHour,
                minValue: 0,
                maxValue: 100,
                onChanged: (value) => setState(() => _selectedHour = value),
              ),
              MainButton(buttonColor: kPrime, buttonTitle: '目標確定',
                  onTapped: () async {
                    print('Firebase処理に入ります。');
                    WeeklyPlan newWeeklyPlan = WeeklyPlan(
                        accountId: myAccount.id,
                        hour: _selectedHour
                    );
                    var result = await WeeklyPlanFirestore.addWeeklyPlan(newWeeklyPlan);
                    if(result == true) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenControl()));
                    }
                  }
              )
            ],
          ),
      ),
    );
  }
}
