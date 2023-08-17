import 'package:flutter/material.dart';
import 'package:reskill_x/component/down_form_screen.dart';
import 'package:reskill_x/component/text_input_field.dart';
import 'package:reskill_x/model/refrection_form.dart';
import 'package:reskill_x/model/set_goal_form.dart';
import 'package:reskill_x/view/goal_confirm_form.dart';
import 'package:reskill_x/view/set_goal_form_screen.dart';

import '../../../component/up_form_screen.dart';
import '../../final_goal_form_screen_complete.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RefrectionFormScreen1(),
    );
  }
}

class UserData {
  String introduction;
  String studyMethod;

  UserData({required this.introduction, required this.studyMethod});
}

class RefrectionFormScreen1 extends StatelessWidget {

  final TextEditingController inputController3 = TextEditingController(); // 追加
  final TextEditingController inputController4 = TextEditingController(); // 追加
  final TextEditingController inputController5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    inputController3.text = SetGoalForm.answer3;
    inputController4.text = SetGoalForm.answer4;
    inputController5.text = SetGoalForm.answer5;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  UpFormScreen(title: '振り返り面談\n\nQ1. 以下のルールに\n同意してください！*'),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => RefrectionFormScreen2()));
              },
            ),
            SizedBox(width: 16), // Add some space between the button and the PageIndicator
          ],
        ),
      ),
    );
  }
}

class RefrectionFormScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UpFormScreen(title:'Q2. 4週～8週で学習した\n学習内容の共有をしてください。*'),
            SizedBox(height: 100),
            Text(
              '・Pythonで〇〇のデータ分析をした',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '・Udemyで〇〇の講義をみて〇〇が\nできるようになった',
              style: TextStyle(fontSize: 16),

            ),
            Text(
              '・〇〇という教材で〇〇を勉強し、\nノートにまとめた。など',
              style: TextStyle(fontSize: 16),
            ),
            RichText(
              text: TextSpan(
                text: '',
              ),
            ),
            SizedBox(height: 90),
            DownFormScreen(
              currentPage:2,
              onTapped:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RefrectionFormScreen3()));
              },
            ),
            SizedBox(height: 16), // Ad
          ],
        ),
      ),
    );
  }
}

class RefrectionFormScreen3 extends StatelessWidget {
  final TextEditingController inputController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UpFormScreen(title:'Q3. あなたは振り返り面談までの4週間\n何を勉強しますか？*'),
            SizedBox(height: 120),
            TextInputField(
              controller: inputController3,
              icon: Icons.book,
              label: '勉強内容',
            ),
            SizedBox(height: 120),
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
                  RefrectionForm.answer3 = inputController3.text;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RefrectionFormScreen4()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RefrectionFormScreen4 extends StatelessWidget {
  final TextEditingController inputController4 = TextEditingController();
  // final String inputText3; // 新しく追加するプロパティ

  // SetGoalFormScreen4({required this.inputText3});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [UpFormScreen(title: 'Q4. どうやって勉強しましたか？\n（参考書、Udemyの講座など）*'),
            SizedBox(height: 120),
            TextInputField(
              controller: inputController4,
              icon: Icons.school,
              label: '勉強方法',
            ),
            SizedBox(height: 120),
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
                  RefrectionForm.answer4 = inputController4.text;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RefrectionFormScreen5()));
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

class RefrectionFormScreen5 extends StatelessWidget {
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
            UpFormScreen(title: 'Q5. この学びはどういうところで\nこれから活きそうですか？*'),
            SizedBox(height: 120),
            TextInputField(
              controller: inputController5,
              icon: Icons.edit,
              label: '応用内容',
            ),
            SizedBox(height: 120),
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
                  RefrectionForm.answer5 = inputController5.text;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FinalGoalFormCompleteScreen()));
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
