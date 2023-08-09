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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("目標画面"),
      ),
      body: SizedBox(
      height: size.height * 0.6,
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               NumberScroll(
                   upperText: '目標時間を設定してください',
                   buttonText: '目標確定',
                   alertA: '週間目標時間',
                   alertB: '目標確定しました',
               ),
            ],
          ),
      ),
    );
  }
}
