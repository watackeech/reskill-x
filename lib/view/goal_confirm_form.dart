import 'package:flutter/material.dart';
import 'package:reskill_x/constant/colors.dart';
import '../component/main_button.dart';
import '../component/text_input_field.dart';
import 'goal_screans/goal_screen.dart';

void main() {
  runApp(GoalConfirmFormScreen());
}

class GoalConfirmFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  bool isCommentChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
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
                        '振り返り面談を実施してください\n（所要時間15分)。',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 25),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '４週間の目標を達成(・未達）した場合、\nなぜそのようになったのかを書いてください。',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      TextInputField(
                        controller: inputController1,
                        icon: Icons.question_answer,
                        label: '要因',
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Checkbox(
                              value: isCommentChecked,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  isCommentChecked = newValue ?? false;
                                });
                              },
                            ),
                            Text(
                              '相手の成功・失敗要因に対して、\nコメント・質問をしてください。',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '自分の学習した内容を共有してください。',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      TextInputField(
                        controller: inputController2,
                        icon: Icons.book,
                        label: '勉強内容',
                      ),
                      SizedBox(height: 10,),
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
                              '相手の学習内容に対してコメント・\n質問をしてください。',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '今回の結果を踏まえて来月はどのような勉強\nをしますか？',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      TextInputField(
                        controller: inputController2,
                        icon: Icons.comment,
                        label: 'コメント・質問',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
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
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0, // ここの値を調整して文字のサイズを変更
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}