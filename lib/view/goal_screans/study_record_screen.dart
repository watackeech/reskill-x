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
class StudyRecordScreen extends StatefulWidget {
  const StudyRecordScreen({super.key});

  @override
  State<StudyRecordScreen> createState() => _StudyRecordScreenState();
}

class _StudyRecordScreenState extends State<StudyRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("進捗登録画面"),
      ),
      body: Center(
        child:
        Column(
          children: [
            NumberScroll(
                upperText: '学習進捗を入力してください',
                buttonText: '進捗確定',
              alertA: '本日の学習時間',
              alertB: '進捗登録しました',
            ),
          ],
        ),
      ),
    );
  }
}
