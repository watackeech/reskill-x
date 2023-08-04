import 'package:flutter/material.dart';
import 'package:reskill_x/component/number_scroll.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("目標画面"),
      ),
      body: Center(
        child:
          NumberScroll(
              upperText: '目標時間を設定してください',
              buttonText: '目標確定'
          ),
      ),
    );
  }
}
