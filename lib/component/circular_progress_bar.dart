import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../constant/colors.dart';

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({super.key, required this.targetHour, required this.targetMinute, required this.currentHour, required this.currentMinute});
  ///targetTime: 目標学習時間
  ///studyTime: 学習進捗時間
  final int targetHour;
  final int targetMinute;
  final int currentHour;
  final int currentMinute;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double targetTime = targetHour + (targetMinute / 60);
    double currentTime = currentHour + (currentMinute/ 60);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: SimpleCircularProgressBar(
            animationDuration: 1,
            size: size.width * 0.3,
            backStrokeWidth: 30,
            progressStrokeWidth: 30,
            backColor: kLightGrey,
            progressColors: [kPrime],
            fullProgressColor: kPrime,
            mergeMode: true,
            valueNotifier: ValueNotifier(calcPercentage(targetTime, currentTime)),
            onGetText: (double value){
              return Text(
                  '${value.toInt()}%',
                  style: TextStyle(fontSize: 20, color: kPrime, fontWeight: FontWeight.bold,),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${currentTime}h /', style: TextStyle(fontSize: 25, color: kPrime,)),
            Icon(Icons.flag, color:kPrime,),
            Text('${targetTime}h', style: TextStyle(fontSize: 25, color: kPrime,)),
          ],
        ),
      ],
    );
  }
  double calcPercentage(double targetTime, double currentTime){
    if(targetTime == 0) {
      return 0;
    }
    return currentTime /targetTime * 100;
  }
}