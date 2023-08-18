import 'package:flutter/material.dart';
import 'package:reskill_x/constant/colors.dart';

import '../view/form_screens/set_goal_form_screens/set_goal_form_screen1.dart';

//import '../view/form_screens/set_goal_form_screens/set_goal_form_screen1.dart';

class DownFormScreen extends StatelessWidget {
  const DownFormScreen({super.key, this.currentPage = 0, required this.onTapped});
  final int currentPage;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          PageIndicator(currentPage: currentPage),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // 前の画面に戻る
                },
                style: ElevatedButton.styleFrom(
                  primary: kGrey,
                  onPrimary: kWhite, // ボタンのテキスト色を白に設定
                ),
                child: Text('戻る'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: onTapped,
                style: ElevatedButton.styleFrom(
                  primary: kPrime,
                  onPrimary: kWhite, // ボタンのテキスト色を白に設定
                ),
                child: Text('次へ'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
