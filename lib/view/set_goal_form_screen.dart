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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController inputController1 = TextEditingController();
  final TextEditingController inputController2 = TextEditingController();
  bool isIntroductionChecked = false;
  bool isInterestChecked = false;
  bool isQuestionChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '目標設定面談を実施してください\n（所要時間15分)。',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Checkbox(
                              value: isIntroductionChecked,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  isIntroductionChecked = newValue ?? false;
                                });
                              },
                            ),
                            Text(
                              '自己紹介をしてください',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      // 以下の部分を追加
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Checkbox(
                              value: isInterestChecked,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  isInterestChecked = newValue ?? false;
                                });
                              },
                            ),
                            Text(
                              '興味分野を共有してください',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'あなたは今月何を勉強しますか？\n（例: エクセルのマクロ、Python）',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      TextInputField(
                        controller: inputController1,
                        icon: Icons.book,
                        label: '勉強内容',
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'あなたは今月どうやって勉強しますか？\n（例: 参考書、Udemy）',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      TextInputField(
                        controller: inputController2,
                        icon: Icons.school,
                        label: '勉強方法',
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Checkbox(
                              value: isQuestionChecked,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  isQuestionChecked = newValue ?? false;
                                });
                              },
                            ),
                            Text(
                              '相手の月間目標に対してコメント・質問\nをしてください',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40,),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GoalScreen()),
                    );
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