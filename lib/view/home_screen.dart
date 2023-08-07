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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("ホーム画面"),
            const SizedBox(
              height: 10,
            ),
            DueDate(),
            ElevatedButton(
              child: Text('アラートダイアログを表示'),
              onPressed: () {
                showDialog<void>(
                    context: context,
                    builder: (_) {
                      return AlertDialogComponent();
                    });
              },
            ),
            AvatarImage(userAvatarUrl: myAccount.imagePath, radius: 0.3, gradeColor: kBronze),
            CircularProgressBar(
              targetTime: 10,
              studyTime: 4,
            ),
            PointIcon(imageUrl: myAccount.imagePath, gradeColor: kBronze,),
          ],
        ),
      ),
    );
  }
}
