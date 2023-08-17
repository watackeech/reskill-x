import 'package:flutter/material.dart';
import 'package:reskill_x/component/down_form_screen.dart';
import 'package:reskill_x/component/text_input_field.dart';
import 'package:reskill_x/model/set_goal_form.dart';
import 'package:reskill_x/view/set_goal_form_screen.dart';

import '../../../component/up_form_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SetGoalFormScreen1(),
    );
  }
}

class UserData {
  String introduction;
  String studyMethod;

  UserData({required this.introduction, required this.studyMethod});
}

class SetGoalFormScreen1 extends StatelessWidget {
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
                  UpFormScreen(title: 'Q1. 自己紹介をしてください*'),
                  SizedBox(height: 20),
                  Text(
                    '名前: Your Name',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '趣味: Your Hobby',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '部署・課: Your Department',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '簡単な仕事内容: Brief Job Description',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            DownFormScreen(
              currentPage:1,
              onTapped:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SetGoalFormScreen2()));
              },
            ),
            SizedBox(width: 16), // Add some space between the button and the PageIndicator
          ],
        ),
      ),
    );
  }
}

class SetGoalFormScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          UpFormScreen(title:'Q2. 興味分野を選んだ背景を\n共有してください。*'),
            SizedBox(height: 50),
            Text('あなたの興味分野：', style: TextStyle(fontSize: 16)),
            RichText(
              text: TextSpan(
                text: 'データ分析、',
                style: TextStyle(fontSize: 16, color: Colors.purple),
                children: <TextSpan>[
                  TextSpan(text: 'Excel', style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('バディの興味分野：', style: TextStyle(fontSize: 16)),
            RichText(
              text: TextSpan(
                text: 'データ分析、',
                style: TextStyle(fontSize: 16, color: Colors.purple),
                children: <TextSpan>[
                  TextSpan(text: 'Powerpoint、', style: TextStyle(fontSize: 16, color: Colors.black)),
                  TextSpan(text: 'word', style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: 100),
            DownFormScreen(
              currentPage:2,
              onTapped:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SetGoalFormScreen3()));
              },
            ),
            SizedBox(height: 16), // Add some space between the button and the PageIndicator
          ],
        ),
      ),
    );
  }
}

class SetGoalFormScreen3 extends StatelessWidget {
  final TextEditingController inputController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UpFormScreen(title:'Q3. あなたは中間報告までの4週間\n何を勉強しますか？*'),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SetGoalFormScreen4()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SetGoalFormScreen4 extends StatelessWidget {
  final TextEditingController inputController4 = TextEditingController();
  // final String inputText3; // 新しく追加するプロパティ

  // SetGoalFormScreen4({required this.inputText3});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [UpFormScreen(title: 'Q4. どうやって勉強しますか？\n（〇〇という参考書、Udemyの〇〇\n講座など）*'),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SetGoalFormScreen5()));
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class SetGoalFormScreen5 extends StatelessWidget {
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
        UpFormScreen(title: 'Q5. 中間報告までに勉強する予定の\n目標時間宣言してください'),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SetGoalFormCompleteScreen()));
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
