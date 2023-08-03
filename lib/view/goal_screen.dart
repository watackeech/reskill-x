import 'package:flutter/material.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("目標画面"),
      ),
      body: Row(
        children: [
          const Center(
            child: Text("目標画面"),
          ),
          Image.asset("")
        ],
      ),
    );
  }
}
