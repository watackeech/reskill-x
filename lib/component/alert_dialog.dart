import 'package:flutter/material.dart';
import '../constant/colors.dart';
import 'main_button.dart';

class AlertDialogComponent extends StatefulWidget {
  AlertDialogComponent({super.key, required this.title, required this.onTapped, required this.hour, required this.minute});
  final String title;
  final int hour;
  final int minute;
  final VoidCallback onTapped;

  @override
  State<AlertDialogComponent> createState() => _AlertDialogComponentState();
}

class _AlertDialogComponentState extends State<AlertDialogComponent> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0), // 角を丸めるための値を指定
      ),
      title:  Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: kBlack, fontWeight: FontWeight.bold),),

      //選択された値をもってくるときのVer(　Text(selectedNumber時間')　)henkou
      content:  Text( '${widget.hour}時間${widget.minute}分',
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
                textStyle: TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                minWidth: 110,
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
                buttonTitle: '確定',
                onTapped: (){
                  Navigator.pop(context);
                  widget.onTapped();
                },
                textStyle: TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                minWidth: 110,
              ),
            ),
          ],
        ),
      ],
    );
  }
}