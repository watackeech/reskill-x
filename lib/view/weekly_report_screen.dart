import 'package:flutter/material.dart';
import 'package:reskill_x/component/circular_progress_bar.dart';
import 'package:reskill_x/model/weekly_plan.dart';

class WeeklyReportScreen extends StatelessWidget {
  const WeeklyReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('２人とも目標達成！'),
                CircularProgressBar(targetTime: 11, studyTime: 6),
              ],
            ),
            SizedBox(width: 20,),
            Column(
              children: [
                Text('２人とも目標達成！'),
                CircularProgressBar(targetTime: 11, studyTime: 6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
