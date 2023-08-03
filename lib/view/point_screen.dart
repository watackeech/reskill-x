import 'package:flutter/material.dart';

class PointScreen extends StatelessWidget {
  const PointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ポイント画面"),
      ),
      body: const Center(
        child: Text("ポイント画面"),
      ),
    );
  }
}
