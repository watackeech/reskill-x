import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../constant/colors.dart';
import 'main_button.dart';


class NumberScroll extends StatefulWidget {
  const NumberScroll({super.key,
  required this.upperText,
  required this.buttonText
  });

  final String upperText;
  final String buttonText;

  @override
  State<NumberScroll> createState() => _NumberScrollState();
}

class _NumberScrollState extends State<NumberScroll> {
  int _currentValue = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Text(widget.upperText,
          style: const TextStyle(
            color: kBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text('$_currentValue　時間',
              style: const TextStyle(
                color: kBlack,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

        NumberPicker(
          //数字選択するやつ
          value: _currentValue,
          minValue: 0,
          maxValue: 24,
          onChanged: (value) => setState(() => _currentValue = value),
        ),


        MainButton(
          buttonColor: kPrime,
          buttonTitle: widget.buttonText,
          onTapped: () {
          // ボタンが押されたときに選択された数字を取得する
            int selectedNumber = _currentValue;
            print('選択された数字: $selectedNumber');
          },
        ),
      ],
    );
  }
}
