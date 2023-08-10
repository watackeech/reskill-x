import 'package:flutter/material.dart';
import 'package:reskill_x/constant/colors.dart';
import '../component/main_button.dart';
import '../component/text_input_field.dart';
import 'home_screen.dart';

void main() {
  runApp(GoalConfirmFormScreen());
}

class GoalConfirmFormScreen extends StatelessWidget {
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
  final TextEditingController inputController0 = TextEditingController();
  final TextEditingController inputController1 = TextEditingController();
  final TextEditingController inputController2 = TextEditingController();

  int selectedLevel = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        'あなたは設定した目標をすべて達成する\nことはできましたか？\n5段階で評価してください。1=最低5=最高',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  // TextInputField(
                  //   controller: inputController0,
                  //   icon: Icons.book,
                  //   label: 'UdemyでPythonを...',
                  // ),
                  // ラジオボタンのリスト
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: 0,
                            onChanged: (value) {},
                          ),
                          Text('1')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: 0,
                            onChanged: (value) {},
                          ),
                          Text('2')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: 0,
                            onChanged: (value) {},
                          ),
                          Text('3')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 3,
                            groupValue: 0,
                            onChanged: (value) {},
                          ),
                          Text('4')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 4,
                            groupValue: 0,
                            onChanged: (value) {},
                          ),
                          Text('5')
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        '今月学習したことを説明してください',
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
                  SizedBox(height: 0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        '来月の抱負を書いてください',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  TextInputField(
                    controller: inputController2,
                    icon: Icons.school,
                    label: '抱負',
                  ),
                  MainButton(
                    buttonColor: kPrime,
                    buttonTitle: '送信',
                    onTapped: () {
                      String text0 = inputController0.text;
                      String text1 = inputController1.text;
                      String text2 = inputController2.text;
                      print('入力フォーム0の値: $text0');
                      print('入力フォーム1の値: $text1');
                      print('入力フォーム2の値: $text2');
                      inputController0.clear();
                      inputController1.clear();
                      inputController2.clear();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
