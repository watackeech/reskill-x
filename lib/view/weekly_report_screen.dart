import 'package:flutter/material.dart';
import 'package:reskill_x/component/circular_progress_bar.dart';
import 'package:reskill_x/component/main_button.dart';
import 'package:reskill_x/view/screen_control.dart';

import '../constant/colors.dart';
import '../main.dart';
import '../model/account.dart';
import '../utils/authentication.dart';
import '../utils/firestore/weekly_plan_firestore.dart';
import 'goal_screans/goal_screen.dart';
import 'home_screen.dart';
import 'monthly_report_screen.dart';

class WeeklyReportScreen extends StatefulWidget {
  WeeklyReportScreen({super.key,});

  @override
  State<WeeklyReportScreen> createState() => _WeeklyReportScreenState();
}

class _WeeklyReportScreenState extends State<WeeklyReportScreen> {
  Account myAccount = Authentication.myAccount!;


  String buttonTitle(int status){
    if(status == 3){
      return '次週の週間目標設定へ';
    }
    else if(status == 4){
      return '月間レポートへ';
    }

    return '';
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: size.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('２人とも目標達成！！', style: TextStyle(color: kBlack, fontSize: 30, fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      FutureBuilder(
                        future: WeeklyPlanFirestore.getWeeklyPlansFromIds(myAccount.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.data.isNotEmpty) {
                            List<Map<String, dynamic>> weeklyPlanList = snapshot.data;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressBar(
                                  targetHour: weeklyPlanList[0]['target_hour'].round(),
                                  targetMinute: weeklyPlanList[0]['target_minute'].round(),
                                  currentHour: weeklyPlanList[0]['current_hour'].round(),
                                  currentMinute: weeklyPlanList[0]['current_minute'].round()
                              ),
                            );
                          } else {
                            return CircularProgressBar(
                                targetHour: 0,
                                targetMinute: 0,
                                currentHour: 0,
                                currentMinute: 0
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      FutureBuilder(
                        future: WeeklyPlanFirestore.getWeeklyPlansFromIds(myAccount.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.data.isNotEmpty) {
                            List<Map<String, dynamic>> weeklyPlanList = snapshot.data;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressBar(
                                  targetHour: weeklyPlanList[0]['target_hour'].round(),
                                  targetMinute: weeklyPlanList[0]['target_minute'].round(),
                                  currentHour: weeklyPlanList[0]['current_hour'].round(),
                                  currentMinute: weeklyPlanList[0]['current_minute'].round()
                              ),
                            );
                          } else {
                            return CircularProgressBar(
                                targetHour: 0,
                                targetMinute: 0,
                                currentHour: 0,
                                currentMinute: 0
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('120', style: TextStyle(color: kPrime, fontSize: 30, fontWeight: FontWeight.bold),),
                      Text('exp', style: TextStyle(color: kPrime, fontSize: 24, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Text('獲得！', style: TextStyle(color: kBlack, fontSize: 24, fontWeight: FontWeight.bold),)
                ],
              ),
              MainButton(
                  buttonColor: kPrime,
                  buttonTitle: buttonTitle(pattern),
                  onTapped: (){

                    switch(pattern){
                      case 3:
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GoalScreen()));
                        break;
                      case 4:
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MonthlyReportScreen()));
                        break;
                    }
                  },
                  textStyle: TextStyle(color: kWhite, fontSize: 24, fontWeight: FontWeight.bold)
              )
            ],
          ),
        ),
      ),
    );
  }
}
