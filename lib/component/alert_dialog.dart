import 'package:flutter/material.dart';
import '../constant/colors.dart';
import 'main_button.dart';

class AlertDialogComponent extends StatelessWidget {
  const AlertDialogComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('目標',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: kBlack, fontWeight: FontWeight.bold),),
      //選択された値をもってくるときのVer(　Text(selectedNumber時間')　)
      content: const Text('2時間',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40, color: kBlack, fontWeight: FontWeight.bold),),
      actions: <Widget>[
      Row(
        children:[
      Padding(
        padding: const EdgeInsets.only(
            right: 10,
            left: 10,
            bottom: 10
        ),
        child: MainButton(
          buttonColor: kGrey,
          buttonTitle: 'キャンセル',
          onTapped: () {
            Navigator.pop(context);
          },
        ),
      ),
      Padding(
      padding: const EdgeInsets.only(
      left: 10,
      right: 10,
      bottom: 10
      ),
        child: MainButton(
          buttonColor: kPrime,
          buttonTitle: '    確定   ',
          onTapped: () {
          },
        ),
      ),
    ],
      ),
      ],
    );
  }
}





