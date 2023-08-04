import 'package:flutter/cupertino.dart';

import '../constant/colors.dart';
import 'main_button.dart';

class DueDate extends StatefulWidget {
  const DueDate({super.key});

  @override
  State<DueDate> createState() => _DueDateState();
}

class _DueDateState extends State<DueDate> {
  @override
  Widget build(BuildContext context) {
    // 現在の日時を取得
    DateTime now = DateTime.now();
    // 曜日を取得 (0: 日曜日, 1: 月曜日, 2: 火曜日, ..., 6: 土曜日)
    int weekDay = now.weekday;
    int leftDay;

    if (weekDay==0) {
      leftDay=1;
    } else {
      leftDay = 8-weekDay;
    }

    return Column(
        children: <Widget>[
      Container(
        width: 300, // 横幅を指定
        height: 70, // 立幅を指定
        padding: EdgeInsets.all(10), // テキストと枠の間の余白を設定
        decoration: BoxDecoration(
        border: Border.all(
        color: kPrime, // 枠の色を指定
        width: 2, // 枠の太さを指定
      ),
      borderRadius: BorderRadius.circular(10), // 枠の角を丸める
          color: kPrime,
      ),
        child:Center(
        child:RichText(
          text:TextSpan(
            style: TextStyle(fontSize: 20, color:kWhite),
            children: [
              TextSpan(text:'あと'),
              TextSpan(
                text: '$leftDay',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              TextSpan(text:'日'),
            ],
          ),
          //text:"あと$leftDay日",
          //style: TextStyle(fontSize: 20,color:kWhite,),
        ),
    ),
      ),
    ],
    );
  }
}
