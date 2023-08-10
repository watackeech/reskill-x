import 'package:flutter/material.dart';
import 'package:reskill_x/component/circular_progress_bar.dart';
import 'package:reskill_x/component/main_button.dart';

import '../constant/colors.dart';
import 'home_screen.dart';
import 'monthly_report_screen.dart';

class WeeklyReportScreen extends StatelessWidget {
  WeeklyReportScreen({super.key,});

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
              MainButton(
                  buttonColor: kPrime,
                  buttonTitle: '月間レポートへ',
                  onTapped: (){
                    // statusについて
                    // 4：学習計画が設定されているかつ期日当日である状態
                    // 5: 学習計画が設定されているかつ期日当日であるかつ4週目である状態
                    int status = 4;
                    switch(status){
                      case 4:
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        break;
                      case 5:
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
