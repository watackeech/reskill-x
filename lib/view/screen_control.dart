import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:reskill_x/view/goal_screans/goal_screen.dart';
import 'package:reskill_x/view/goal_screans/study_record_screen.dart';
import 'package:reskill_x/view/profile_screens/profile_control.dart';
import 'package:reskill_x/view/profile_screens/profile_screen.dart';
import '../component/point_icon.dart';
import '../constant/colors.dart';
import '../model/account.dart';
import '../utils/authentication.dart';
import 'goal_screans/goal_control.dart';
import 'home_screen.dart';
import 'memo_screens/memo_list_Screen.dart';

class ScreenControl extends StatefulWidget {
  const ScreenControl({super.key});

  @override
  State<ScreenControl> createState() => _ScreenControlState();
}

class _ScreenControlState extends State<ScreenControl> {
  Account myAccount = Authentication.myAccount!;
  int selectedPage = 1; // インスタンス変数として宣言

  final List<Widget> _pageNo = [MemoListScreen(), HomeScreen(), StudyRecordScreen(), ProfileControl()];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PointIcon(imageUrl: myAccount.imagePath, gradeColor: kBronze,),
            ],
          ),
        ),
          body: Center(
            child: _pageNo[selectedPage],
          ),
          // body: _pageNo[selectedPage],
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: kPrime,
            items: [
              TabItem(icon: Icons.edit_note , title: 'メモ'),
              TabItem(icon: Icons.home, title: 'ホーム'),
              TabItem(icon: Icons.flag, title: '進捗登録'),
              TabItem(icon: Icons.person, title: 'プロフィール'),
            ],
            initialActiveIndex: selectedPage,
            onTap: (int index) {
              setState(() {
                selectedPage = index;
              });
            },
          )
      ),
    );
  }
}