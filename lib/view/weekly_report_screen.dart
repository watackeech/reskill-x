import 'package:flutter/material.dart';
import 'package:reskill_x/component/circular_progress_bar.dart';
import 'package:reskill_x/component/main_button.dart';

import '../constant/colors.dart';

class WeeklyReportScreen extends StatelessWidget {
  const WeeklyReportScreen({super.key});

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
                children: const [
                  Column(
                    children: [
                      CircularProgressBar(targetTime: 11, studyTime: 6),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      CircularProgressBar(targetTime: 11, studyTime: 6),
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
              MainButton(buttonColor: kPrime, buttonTitle: '月間レポートへ', onTapped: (){}, textStyle: TextStyle(color: kWhite, fontSize: 24, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}