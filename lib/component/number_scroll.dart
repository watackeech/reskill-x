import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../constant/colors.dart';
import 'alert_dialog.dart';
import 'main_button.dart';

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


class NumberScroll extends StatefulWidget {
  NumberScroll({super.key,
    required this.upperText,
    required this.buttonText,
    required this.alertA,
    required this.alertB,
  });

  final String upperText;
  final String buttonText;
  final String alertA;
  final String alertB;
  Account myAccount = Authentication.myAccount!;

  @override
  State<NumberScroll> createState() => _NumberScrollState();
}

class _NumberScrollState extends State<NumberScroll> {
  int _selecthour = 0;
  int _selectminute=0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * 0.38,
        child:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Text(widget.upperText,
          style: const TextStyle(
            color: kBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),


        Center(
        child:Row(
            mainAxisAlignment: MainAxisAlignment.center, // ロウを中央寄せにす
          children:[
            NumberPicker(
            //時
            value: _selecthour,
            minValue: 0,
            maxValue: 24,
            onChanged: (value) => setState(() => _selecthour = value)
             ),

            Text('時間',
              style: const TextStyle(
                color: kBlack,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            NumberPicker(
              //分
                value: _selectminute,
                minValue: 0,
                maxValue: 45,
                step:15,
                onChanged: (value) => setState(() => _selectminute = value)
            ),

            Text('分',
              style: const TextStyle(
                color: kBlack,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            ]
          ),
        ),

        MainButton(
          buttonColor: kPrime,
          buttonTitle: widget.buttonText,
          onTapped:(){
              showDialog<void>(
                  context: context,
                  builder: (_) {
                    return AlertDialogComponent(
                      title: widget.alertA,
                      hour: _selecthour,
                      minute: _selectminute,
                      onTapped:(){
                        showDialog<void>(
                          context: context,
                        builder: (_) {
                            return AlertDialogComponent(
                              title: widget.alertB,
                              hour: _selecthour,
                              minute: _selectminute,
                                onTapped:(){
                                  /*print('Firebase処理に入ります。');
                                    WeeklyPlan newWeeklyPlan = WeeklyPlan(
                                      accountId: widget.myAccount.id,
                                      hour:_selecthour,
                                      minute:_selectminute
                                    );
                                    var result = await WeeklyPlanFirestore.addWeeklyPlan(newWeeklyPlan);
                                    if(result == true) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenControl()));
                                   }*/

                                  //ホーム画面に送信する作業を書く

                                    },
                            );
                        });
                      },
                    );
                  });
            },

          textStyle: TextStyle(
            color: kWhite,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          minWidth: 110,
        ),
      ],
    ),
    );
  }
}
