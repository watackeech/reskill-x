import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:reskill_x/component/avatar_image.dart';
import 'package:reskill_x/component/due_date.dart';
import 'package:reskill_x/component/main_button.dart';

import '../component/alert_dialog.dart';
import '../component/circular_progress_bar.dart';
import '../component/point_icon.dart';
import '../constant/colors.dart';
import '../model/account.dart';
import '../utils/authentication.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Account myAccount = Authentication.myAccount!;

  //statusについて
  // 1：１週目かつ学習計画が設定されていない状態
  // 2：２～４週目かつ学習計画が設定されていない状態
  // 3：学習計画が設定されているかつ期日当日でない状態
  // 4：学習計画が設定されているかつ期日当日である状態
  // 最終的にはテーブルに格納されている学習計画設定日と現在の日付から状態を判別する
  int status = 1;

  @override
  Widget build(BuildContext context) {

    String alertMessage = 'test';
    if(status == 1 || status == 2){
        alertMessage = '今週の目標時間を設定してください';
    }

    return Scaffold(

      body: Center(
        child: Column(
          children: [
            const Text("目標期日まで"),
            const SizedBox(
              height: 10,
            ),
            DueDate(),
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AvatarImage(userAvatarUrl: myAccount.imagePath, radius: 0.2, gradeColor: kBronze),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AvatarImage(userAvatarUrl: myAccount.imagePath, radius: 0.2, gradeColor: kBronze),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressBar(
                      targetTime: 10,
                      studyTime: 4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressBar(
                      targetTime: 10,
                      studyTime: 3,
                    ),
                  ),
                ],
              ),
            ),
            Text(alertMessage,
            style: TextStyle(color: kPrime),
            ),
          ],
        ),
      ),
    );


  }
}
