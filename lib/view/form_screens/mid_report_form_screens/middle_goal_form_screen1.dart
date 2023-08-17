import 'package:flutter/material.dart';
import 'package:reskill_x/component/down_form_screen.dart';
import 'package:reskill_x/component/text_input_field.dart';
import 'package:reskill_x/model/middle_goal_form.dart';
import 'package:reskill_x/model/set_goal_form.dart';
import 'package:reskill_x/view/mid_goal_form_screen_complete.dart';
import 'package:reskill_x/view/set_goal_form_screen.dart';

import '../../../component/up_form_screen.dart';
import '../../middle_goal_form_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MiddleGoalFormScreen1(),
    );
  }
}

class UserData {
  String introduction;
  String studyMethod;

  UserData({required this.introduction, required this.studyMethod});
}

class MiddleGoalFormScreen1 extends StatelessWidget {
  final TextEditingController inputController1 = TextEditingController();
  final TextEditingController inputController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  UpFormScreen(title: '中間報告面談\nQ1. 以下のルールに同意してください！*'),
                  SizedBox(height: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '・ バディのことは否定しない',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '・ 褒め合いを意識する',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '・ 次どうするかをポジティブに考える',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 100),
            DownFormScreen(
              currentPage:1,
              onTapped:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MiddleGoalFormScreen2()));
              },
            ),
            SizedBox(width: 16), // Add some space between the button and the PageIndicator
          ],
        ),
      ),
    );
  }
}

class MiddleGoalFormScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UpFormScreen(title:'Q2. 4週間で学習した\n学習内容の共有をしてください。*'
            ),
            SizedBox(height: 100),
            DownFormScreen(
              currentPage:2,
              onTapped:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MiddleGoalFormScreen3()));
              },
            ),
            SizedBox(height: 16), // Add some space between the button and the PageIndicator
          ],
        ),
      ),
    );
  }
}

class MiddleGoalFormScreen3 extends StatelessWidget {
  final TextEditingController inputController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UpFormScreen(title:'Q3. あなたは\n振り返り面談までの\n4週間何を勉強しますか？*'),
            SizedBox(height: 50),
            TextInputField(
              controller: inputController3,
              icon: Icons.book,
              label: '勉強内容',
            ),
            SizedBox(height: 100),
            DownFormScreen(
              currentPage:3,
              onTapped:(){
                if (inputController3.text == null || inputController3.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('テキストが空です'),
                    ),
                  );
                }else{
                  MiddleGoalForm.answer3 = inputController3.text;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MiddleGoalFormScreen4()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MiddleGoalFormScreen4 extends StatelessWidget {
  final TextEditingController inputController4 = TextEditingController();
  // final String inputText3; // 新しく追加するプロパティ

  // SetGoalFormScreen4({required this.inputText3});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [UpFormScreen(title: 'Q4. どうやって勉強しますか？\n（参考書、Udemyの講座など）*'),
            SizedBox(height: 50),
            TextInputField(
              controller: inputController4,
              icon: Icons.school,
              label: '勉強方法',
            ),
            SizedBox(height: 100),
            DownFormScreen(
              currentPage:4,
              onTapped:(){
                if (inputController4.text == null || inputController4.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('テキストが空です'),
                    ),
                  );
                }else{
                  MiddleGoalForm.answer4 = inputController4.text;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MiddleGoalFormScreen5()));
                }
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class MiddleGoalFormScreen5 extends StatelessWidget {
  final TextEditingController inputController5 = TextEditingController();
  // final String inputText3; // 追加
  // final String inputText4; // 追加
  // SetGoalFormScreen5({required this.inputText3, required this.inputText4}); // コンストラクタ追加

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UpFormScreen(title: 'Q5. 振り返り面談までに\n勉強する予定の目標時間を\n宣言してください*'),
            SizedBox(height: 50),
            TextInputField(
              controller: inputController5,
              icon: Icons.timelapse,
              label: '勉強時間',
            ),
            SizedBox(height: 100),
            DownFormScreen(
              currentPage:5,
              onTapped:(){
                if (inputController5.text == null || inputController5.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('テキストが空です'),
                    ),
                  );
                }else{
                  MiddleGoalForm.answer5 = inputController5.text;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MidGoalFormCompleteScreen()));
                }
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int currentPage;

  PageIndicator({required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index + 1 ? Colors.blue : Colors.grey,
          ),
        );
      }),
    );
  }
}
