import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:reskill_x/view/goal_screans/goal_screen.dart';
import '../constant/colors.dart';
import 'account_screens/account_screen.dart';
import 'home_screen.dart';

class ScreenControl extends StatefulWidget {
  const ScreenControl({super.key});

  @override
  State<ScreenControl> createState() => _ScreenControlState();
}

class _ScreenControlState extends State<ScreenControl> {
  int selectedPage = 1; // インスタンス変数として宣言

  final List<Widget> _pageNo = [GoalScreen(), HomeScreen(), AccountScreen()];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          body: Center(
            child: _pageNo[selectedPage],
          ),
          // body: _pageNo[selectedPage],
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: kPrime,
            items: [
              TabItem(icon: Icons.flag, title: '目標・進捗'),
              TabItem(icon: Icons.home, title: 'ホーム'),
              TabItem(icon: Icons.person, title: 'アカウント'),
            ],
            initialActiveIndex: selectedPage,
            onTap: (int index) {
              setState(() {
                selectedPage = index;
              });
            },
          ),
        floatingActionButton: FloatingActionButton(onPressed: () {  },),
      ),
    );
  }
}