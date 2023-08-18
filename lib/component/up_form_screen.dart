import 'package:flutter/material.dart';
import 'package:reskill_x/component/memo_button.dart';

class UpFormScreen extends StatelessWidget {
  const UpFormScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width:300,
            ),
            MemoButton()
          ],
        ),
        SizedBox(height: 60),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),

      ],
    );
  }
}