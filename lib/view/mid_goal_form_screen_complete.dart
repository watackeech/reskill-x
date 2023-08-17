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
  final TextEditingController inputController3 = TextEditingController(); // 追加
  final TextEditingController inputController4 = TextEditingController(); // 追加
  final TextEditingController inputController5 = TextEditingController();
  bool isIntroductionChecked = true;
  bool isInterestChecked = true;

  @override
  Widget build(BuildContext context) {
    inputController3.text = MiddleGoalForm.answer3;
    inputController4.text = MiddleGoalForm.answer4;
    inputController5.text = MiddleGoalForm.answer5;

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
                            'Q1. 以下のルールに同意してください！*\n・ バディのことは否定しない\n・ 褒め合いを意識する\n・ 次どうするかをポジティブに考える',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ),
                          Checkbox(
                            value: isIntroductionChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isIntroductionChecked = newValue ?? true;
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
                            value: isInterestChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isInterestChecked = newValue ?? true;
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
                      controller: inputController3,
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
                      controller: inputController4,
                      icon: Icons.school,
                      label: '勉強方法',
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                        'Q5. 振り返り面談までに\n勉強する予定の目標時間を宣言してください*',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ) ,
                    ),
                    TextInputField(
                      controller: inputController5,
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
                  if (isIntroductionChecked == false || isInterestChecked == false ||
                  inputController3.text == null || inputController3.text.isEmpty ||
                  inputController4.text == null || inputController4.text.isEmpty ||
                  inputController5.text == null || inputController5.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('入力されていない項目があります'),
                      ),
                    );
                  }else{
                    MiddleGoalForm.answer3 = inputController3.text;
                    MiddleGoalForm.answer4 = inputController4.text;
                    MiddleGoalForm.answer5 = inputController5.text;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GoalScreen()));
                  }
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