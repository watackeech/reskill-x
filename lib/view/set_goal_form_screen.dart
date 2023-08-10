import 'package:flutter/material.dart';
import 'package:reskill_x/constant/colors.dart';
import '../component/main_button.dart';
import '../component/text_input_field.dart';
import 'goal_screans/goal_screen.dart';
void main() {
  runApp(SetGoalFormScreen());
}
class SetGoalFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final TextEditingController inputController1 = TextEditingController();
  final TextEditingController inputController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '目標設定面談を実施して、\n設定した目標を入力してください。',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      'あなたは今月何を勉強しますか？\n（例: エクセルのマクロ、Python）',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                TextInputField(
                  controller: inputController1,
                  icon: Icons.book,
                  label: '勉強内容',
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      'あなたは今月どうやって勉強しますか？\n（例: 参考書、Udemy）',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                TextInputField(
                  controller: inputController2,
                  icon: Icons.school,
                  label: '勉強方法',
                ),
                MainButton(
                  buttonColor: kPrime,
                  buttonTitle: '送信',
                  onTapped: () {
                    String text1 = inputController1.text;
                    String text2 = inputController2.text;
                    print('入力フォーム1の値: $text1');
                    print('入力フォーム2の値: $text2');
                    inputController1.clear();
                    inputController2.clear();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GoalScreen()));
                  },
                  textStyle: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
