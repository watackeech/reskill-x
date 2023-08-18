import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:reskill_x/component/main_button.dart';
import 'package:reskill_x/component/number_scroll.dart';
import 'package:reskill_x/constant/colors.dart';
import 'package:reskill_x/model/weekly_plan.dart';
import 'package:reskill_x/view/screen_control.dart';

import '../../component/alert_dialog.dart';
import '../../model/account.dart';
import '../../utils/authentication.dart';
import '../../utils/firestore/weekly_plan_firestore.dart';
import '../home_screen.dart';
class StudyRecordScreen extends StatefulWidget {
  const StudyRecordScreen({super.key});
  static const String route = '/goal/study_record';

  @override
  State<StudyRecordScreen> createState() => _StudyRecordScreenState();
}

class _StudyRecordScreenState extends State<StudyRecordScreen> {
  Account myAccount = Authentication.myAccount!;
  int _selecthour = 0;
  int _selectminute=0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("進捗登録画面"),
      // ),
      body: Center(
        child:
        Column(
          children: [
            SizedBox(
              height: size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '学習進捗を入力してください',
                    style: const TextStyle(
                      color: kBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ロウを中央寄せにす
                        children: [
                          NumberPicker(
                            //時
                              value: _selecthour,
                              minValue: 0,
                              maxValue: 24,
                              onChanged: (value) =>
                                  setState(() => _selecthour = value)),
                          Text(
                            '時間',
                            style: const TextStyle(
                              color: kBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          NumberPicker(
                            //分
                              value: _selectminute,
                              minValue: 0,
                              maxValue: 45,
                              step: 15,
                              onChanged: (value) =>
                                  setState(() => _selectminute = value)),
                          Text(
                            '分',
                            style: const TextStyle(
                              color: kBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MainButton(
                    buttonColor: kPrime,
                    buttonTitle: '進捗確定',
                    onTapped: () {
                      showDialog<void>(
                          context: context,
                          builder: (_) {
                            return AlertDialogComponent(
                              title: '本日の学習時間',
                              hour: _selecthour,
                              minute: _selectminute,
                              onTapped: () async {
                                print(myAccount.name);
                                var result = await WeeklyPlanFirestore.updateWeeklyPlan(myAccount.id, _selecthour, _selectminute);
                                if(result == true) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenControl()));
                                  print('確認');
                                  // Navigator.pop(context);
                                }
                              },
                            );
                          });
                    },
                    textStyle: TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    minWidth: 110,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
