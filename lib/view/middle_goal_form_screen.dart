import 'package:flutter/material.dart';
import 'package:reskill_x/constant/colors.dart';
import 'package:reskill_x/model/middle_goal_form.dart';
import '../component/main_button.dart';
import '../component/text_input_field.dart';
// import 'form_screens/set_goal_form_screens/set_goal_form_screen1.dart';
import 'goal_screans/goal_screen.dart';

void main() {
  runApp(MidGoalFormCompleteScreen());
}

class MidGoalFormCompleteScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: SizedBox(
          //height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40,),
                    Text(
                      '中間報告面談の最終確認です。\n次の5つの議題をバディと確認できたら。\n完了ボタンを押してください！',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            'Q1. 以下のルールに同意してください！*\n・バディのことは否定しない\n・褒め合いを意識する\n・次どうするかをポジティブに考える',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ),
                          Checkbox(
                            value: true,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isIntroductionChecked = newValue ?? false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    // 以下の部分を追加
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            'Q2. 4週間で学習した\n学習内容の共有をしてください。*',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ),
                          Checkbox(
                            value: true,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isInterestChecked = newValue ?? false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Q3. あなたは振り返り面談までの\n4週間何を勉強しますか？*',
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
                        'Q4. どうやって勉強しますか？\n（参考書、Udemyの講座など）*',
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
                      child:Text(
                        'Q5. 中間報告までに勉強する予定の目標時間を\n宣言してください*',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ) ,
                    ),
                    TextInputField(
                      controller: inputController2,
                      icon: Icons.timelapse,
                      label: '勉強時間',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              // PageIndicator(currentPage: 6),
              MainButton(
                buttonColor: kPrime,
                buttonTitle: '完了',
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
                  fontSize: 20.0, // ここの値を調整して文字のサイズを変更
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}