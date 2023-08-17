import 'package:flutter/material.dart';
import 'package:reskill_x/constant/colors.dart';
import 'package:reskill_x/view/home_screen.dart';
import 'package:reskill_x/view/screen_control.dart';
import '../component/main_button.dart';
import '../component/text_input_field.dart';
import '../model/set_goal_form.dart';
import 'form_screens/set_goal_form_screens/set_goal_form_screen1.dart';
import 'goal_screans/goal_screen.dart';

void main() {
  runApp(SetGoalFormCompleteScreen());
}

class SetGoalFormCompleteScreen extends StatelessWidget {
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
    inputController3.text = SetGoalForm.answer3;
    inputController4.text = SetGoalForm.answer4;
    inputController5.text = SetGoalForm.answer5;


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
                      '目標設定面談です。次の5つの議題をバディと\n共有し、回答してください。',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            'Q1. 自己紹介をしてください（名前、\n趣味、部署・課、簡単な仕事内容など）*',
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
                            'Q2. 興味分野を選んだ背景を共有\nしてください。*',
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
                        'Q3. あなたは中間報告までの4週間何を勉強\nしますか？*',
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
                        'Q4. どうやって勉強しますか？（〇〇という参考書、Udemyの〇〇の講座など）*',
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
                        'Q5. 中間報告までに勉強する予定の目標時間を\n宣言してください*',
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
              SizedBox(height: 40,),
              MainButton(
                buttonColor: kPrime,
                buttonTitle: '完了',
                onTapped: () {
                  String text3 = inputController3.text; // 追加
                  String text4 = inputController4.text; // 追加
                  String text5 = inputController5.text;
                  print('入力フォーム3の値: $text3'); // 追加
                  print('入力フォーム4の値: $text4'); // 追加
                  print('入力フォーム5の値: $text5');
                  inputController3.clear(); // 追加
                  inputController4.clear(); // 追加
                  inputController5.clear();

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
    );
  }
}