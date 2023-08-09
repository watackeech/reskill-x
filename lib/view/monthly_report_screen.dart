import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:reskill_x/component/avatar_image.dart';

import '../component/main_button.dart';
import '../constant/colors.dart';

class MonthlyReportScreen extends StatelessWidget {
  const MonthlyReportScreen({super.key});

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
              SizedBox(height: size.height * 0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      AvatarImage(
                          userAvatarUrl: "https://firebasestorage.googleapis.com/v0/b/reskil-x.appspot.com/o/9gWEFH0XYYSPYcKwZmFcagEsMds1?alt=media&token=980ec35b-55b2-4b19-86ff-5494a5396bb8",
                          radius: 0.15,
                          gradeColor: kBronze
                      ),
                      Text(
                        '田中真司',
                        style: TextStyle(
                            color: kBlack, fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      AvatarImage(
                          userAvatarUrl: "https://firebasestorage.googleapis.com/v0/b/reskil-x.appspot.com/o/JQKZ6GmCtGPEOs7P7rEjiyJ7PJh2?alt=media&token=e2709a35-7377-4a75-9088-06e74aa05254",
                          radius: 0.15,
                          gradeColor: kBronze
                      ),
                      Text(
                        '古森聡志',
                        style: TextStyle(
                            color: kBlack, fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ProgressBar(progress: 70),
                      ProgressBar(progress: 70),
                      ProgressBar(progress: 70),
                      ProgressBar(progress: 70),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.225,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DisplayWeek(weekCount: 1),
                        DisplayWeek(weekCount: 2),
                        DisplayWeek(weekCount: 3),
                        DisplayWeek(weekCount: 4),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      ProgressBar(progress: 70),
                      ProgressBar(progress: 70),
                      ProgressBar(progress: 70),
                      ProgressBar(progress: 70),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03,),
              MainButton(
                  buttonColor: kPrime,
                  buttonTitle: '振返り面談フォームへ',
                  onTapped: () {},
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
    return Text('W$weekCount', style: TextStyle(
        color: kBlack, fontSize: 22, fontWeight: FontWeight.w400),);
  }
}
