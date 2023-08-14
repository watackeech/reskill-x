import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:reskill_x/component/avatar_image.dart';
import 'package:reskill_x/view/goal_confirm_form.dart';

import '../component/circular_progress_bar.dart';
import '../component/main_button.dart';
import '../constant/colors.dart';
import '../model/account.dart';
import '../utils/authentication.dart';
import '../utils/firestore/weekly_plan_firestore.dart';

class MonthlyReportScreen extends StatefulWidget {
  const MonthlyReportScreen({super.key});

  @override
  State<MonthlyReportScreen> createState() => _MonthlyReportScreenState();
}

class _MonthlyReportScreenState extends State<MonthlyReportScreen> {
  Account myAccount = Authentication.myAccount!;
  Account buddyAccount = Authentication.buddyAccount!;
  List<Map<String, dynamic>> _myWeeklyPlans = [];
  List<Map<String, dynamic>> _buddyWeeklyPlans = [];


  @override
  void initState() {
    super.initState();
    fetchWeeklyPlans(); // Fetch weekly plans when the screen is initialized
  }

  Future<void> fetchWeeklyPlans() async {
    List<Map<String, dynamic>> myWeeklyPlans = await WeeklyPlanFirestore.getWeeklyPlansFromIds(myAccount.id); // Update this according to your data structure
    List<Map<String, dynamic>> buddyWeeklyPlans = await WeeklyPlanFirestore.getWeeklyPlansFromIds(buddyAccount.id); // Update this according to your data structure
    setState(() {
      _myWeeklyPlans = myWeeklyPlans;
      _buddyWeeklyPlans = buddyWeeklyPlans;
    });
  }

  // Future<void> _loadWeeklyPlans() async {
  //   var myWeeklyPlans = await WeeklyPlanFirestore.getWeeklyPlansFromIds(myAccount.id);
  //   var buddyWeeklyPlans = await WeeklyPlanFirestore.getWeeklyPlansFromIds(buddyAccount.id);
  //   setState(() {
  //     _myWeeklyPlans = myWeeklyPlans;
  //     _buddyWeeklyPlans = buddyWeeklyPlans;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: size.height * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '一か月お疲れさまでした！',
                style: TextStyle(
                    color: kBlack, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      AvatarImage(
                          userAvatarUrl:
                              "https://firebasestorage.googleapis.com/v0/b/reskil-x.appspot.com/o/9gWEFH0XYYSPYcKwZmFcagEsMds1?alt=media&token=980ec35b-55b2-4b19-86ff-5494a5396bb8",
                          radius: 0.15,
                          gradeColor: kBronze),
                      Text(
                        '田中真司',
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      AvatarImage(
                          userAvatarUrl:
                              "https://firebasestorage.googleapis.com/v0/b/reskil-x.appspot.com/o/JQKZ6GmCtGPEOs7P7rEjiyJ7PJh2?alt=media&token=e2709a35-7377-4a75-9088-06e74aa05254",
                          radius: 0.15,
                          gradeColor: kBronze),
                      Text(
                        '古森聡志',
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              // ListView.builder(
              // itemCount: 4,
              //   itemBuilder: (context, index) {
              //     var weeklyPlan = _myWeeklyPlans[index];
              //     double targetTime = weeklyPlan['target_hour'] * 60 + weeklyPlan['target_minute'];
              //     double currentTime = weeklyPlan['current_hour'] * 60 + weeklyPlan['current_minute'];
              //     double progress = 0;
              //     if(targetTime != 0){
              //        progress = currentTime / targetTime;
              //     }
              //     return ProgressBar(progress: progress);
              //   },
              // ),
                  Column(
                    children: _myWeeklyPlans.map((data) {
                      int targetTime = data['target_hour'].round() * 60 + data['target_minute'].round();
                      int currentTime = data['current_hour'].round() * 60 + data['current_minute'].round();
                      double progress = 0;
                      if(targetTime != 0){
                        progress = currentTime / targetTime;
                      }
                      return ProgressBar(progress: progress * 100);
                    }).toList(),
                  ),
                  SizedBox(
                    height: size.height * 0.225,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        DisplayWeek(weekCount: 1),
                        DisplayWeek(weekCount: 2),
                        DisplayWeek(weekCount: 3),
                        DisplayWeek(weekCount: 4),
                      ],
                    ),
                  ),
                  Column(
                    children: _buddyWeeklyPlans.map((data) {
                      int targetTime = data['target_hour'].round() * 60 + data['target_minute'].round();
                      int currentTime = data['current_hour'].round() * 60 + data['current_minute'].round();
                      double progress = 0;
                      if(targetTime != 0){
                        progress = currentTime / targetTime;
                      }
                      return ProgressBar(progress: progress * 100);
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              MainButton(
                  buttonColor: kPrime,
                  buttonTitle: '振返り面談フォームへ',
                  onTapped: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GoalConfirmFormScreen()));
                  },
                  textStyle: TextStyle(
                      color: kWhite, fontSize: 23, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.width * 0.4,
        child: FAProgressBar(
          currentValue: progress,
          displayText: '%',
          backgroundColor: kLightGrey,
          progressColor: kPrime,
          changeProgressColor: kThird,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}

class DisplayWeek extends StatelessWidget {
  const DisplayWeek({super.key, required this.weekCount});

  final int weekCount;

  @override
  Widget build(BuildContext context) {
    return Text(
      'W$weekCount',
      style:
          TextStyle(color: kBlack, fontSize: 22, fontWeight: FontWeight.w400),
    );
  }
}
