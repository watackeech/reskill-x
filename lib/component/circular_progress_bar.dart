import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../constant/colors.dart';

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({super.key, required this.targetTime, required this.studyTime});
  ///targetTime: 目標学習時間
  ///studyTime: 学習進捗時間
  final int targetTime;
  final int studyTime;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: SimpleCircularProgressBar(
            size: size.width * 0.3,
            backStrokeWidth: 30,
            progressStrokeWidth: 30,
            backColor: Colors.lightBlueAccent,
            progressColors: [kPrime],
            mergeMode: true,
            valueNotifier: ValueNotifier(studyTime /targetTime * 100),
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
            Icon(Icons.flag, color:kPrime,),
            Text('${targetTime}h', style: TextStyle(fontSize: 30, color: kPrime,)),
          ],
        ),
      ],
    );
  }
}
