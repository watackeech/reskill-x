import 'package:flutter/material.dart';
import 'package:reskill_x/component/circular_progress_bar.dart';
import 'package:reskill_x/component/main_button.dart';
import 'package:reskill_x/utils/firestore/user_firestore.dart';
import 'package:reskill_x/view/screen_control.dart';

import '../constant/colors.dart';
import '../model/account.dart';
import '../utils/authentication.dart';
import '../utils/firestore/weekly_plan_firestore.dart';
import 'goal_screans/goal_screen.dart';
import 'home_screen.dart';
import 'monthly_report_screen.dart';

class WeeklyReportScreen extends StatefulWidget {
  WeeklyReportScreen({
    super.key,
  });

  @override
  State<WeeklyReportScreen> createState() => _WeeklyReportScreenState();
}

class _WeeklyReportScreenState extends State<WeeklyReportScreen> {
  Account myAccount = Authentication.myAccount!;
  Account buddyAccount = Authentication.buddyAccount!;
  Map<String, dynamic> _myWeeklyReport = {};
  Map<String, dynamic> _buddyWeeklyReport = {};

  bool haveIAchieved = false;
  bool hasBuddyAchieved = false;
  bool isDataLoaded = false;

  // statusについて
  // 4：学習計画が設定されているかつ期日当日である状態
  // 5: 学習計画が設定されているかつ期日当日であるかつ4週目である状態
  int status = 5;

  String buttonTitle(int status) {
    if (status == 4) {
      return '次週の週間目標設定へ';
    } else if (status == 5) {
      return '月間レポートへ';
    }
    return '';
  }

  @override
  void initState() {
    super.initState();
    fetchDataAndInitialize();
  }

  Future<void> fetchDataAndInitialize() async {
    print('フェッチデータが始まりました');
    await fetchWeeklyReport(); // データ取得を完了させる
    updateAchieved(); // データ取得が完了したので情報を更新
    setState(() {
      isDataLoaded = true; // データが読み込まれたことを示すフラグを立てる
    });
  }

  Future<void> fetchWeeklyReport() async {
    List<Map<String, dynamic>> myWeeklyReport =
        await WeeklyPlanFirestore.getWeeklyPlansFromIds(myAccount.id);
    List<Map<String, dynamic>> buddyWeeklyReport =
        await WeeklyPlanFirestore.getWeeklyPlansFromIds(buddyAccount.id);
    setState(() {
      _myWeeklyReport = myWeeklyReport[0];
      _buddyWeeklyReport = buddyWeeklyReport[0];
    });
  }

  Future<void> updateAchieved() async {
    int myTargetTime = _myWeeklyReport['target_hour'].round() * 60 + _myWeeklyReport['target_minute'].round();
    int myCurrentTime = _myWeeklyReport['current_hour'].round() * 60 + _myWeeklyReport['current_minute'].round();
    int buddyTargetTime = _buddyWeeklyReport['target_hour'].round() * 60 + _buddyWeeklyReport['target_minute'].round();
    int buddyCurrentTime = _buddyWeeklyReport['current_hour'].round() * 60 + _buddyWeeklyReport['current_minute'].round();
    setState(() {
      haveIAchieved = myTargetTime <= myCurrentTime;
      hasBuddyAchieved = buddyTargetTime <= buddyCurrentTime;
      print('あなたの達成状況は：$haveIAchieved');
      print('バディの達成状況は：$hasBuddyAchieved');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (!isDataLoaded) {
      // データが読み込まれていない場合、ローディング表示を行う
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: SizedBox(
            height: size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                generateMessage(haveIAchieved, hasBuddyAchieved),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressBar(
                              targetHour: _myWeeklyReport['target_hour']
                                  .round(),
                              targetMinute:
                              _myWeeklyReport['target_minute'].round(),
                              currentHour:
                              _myWeeklyReport['current_hour'].round(),
                              currentMinute:
                              _myWeeklyReport['current_minute'].round()),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressBar(
                              targetHour: _buddyWeeklyReport['target_hour']
                                  .round(),
                              targetMinute:
                              _buddyWeeklyReport['target_minute'].round(),
                              currentHour:
                              _buddyWeeklyReport['current_hour'].round(),
                              currentMinute:
                              _buddyWeeklyReport['current_minute'].round()),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '120',
                          style: TextStyle(
                              color: kPrime,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'exp',
                          style: TextStyle(
                              color: kPrime,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      '獲得！',
                      style: TextStyle(
                          color: kBlack,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                MainButton(
                    buttonColor: kPrime,
                    buttonTitle: buttonTitle(status),
                    onTapped: () {
                      if (haveIAchieved && hasBuddyAchieved) {
                        UserFirestore.updateExp(
                            myAccount.id, _myWeeklyReport['target_hour'].round(), _myWeeklyReport['target_minute'].round());
                        UserFirestore.updateExp(
                            buddyAccount.id,
                            _buddyWeeklyReport['target_hour'].round(),
                            _buddyWeeklyReport['target_minute'].round());
                        print('目標達成成功！！！');
                      }
                      switch (status) {
                        case 4:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GoalScreen()));
                          break;
                        case 5:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MonthlyReportScreen()));
                          break;
                      }
                    },
                    textStyle: TextStyle(
                        color: kWhite,
                        fontSize: 24,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget generateMessage(bool haveIAchieved, bool hasBuddyAchieved) {
    if (haveIAchieved && hasBuddyAchieved) {
      return Text(
        '２人とも週間目標を\n達成しました！！！',
        style:
            TextStyle(color: kBlack, fontSize: 30, fontWeight: FontWeight.bold),
      );
    } else if (hasBuddyAchieved) {
      return Text(
        'あなたが週間目標を\n達成できませんでした...',
        style:
            TextStyle(color: kBlack, fontSize: 30, fontWeight: FontWeight.bold),
      );
    } else if (haveIAchieved) {
      return Text(
        'あなたのバディが週間目標を\n達成できませんでした...',
        style:
            TextStyle(color: kBlack, fontSize: 30, fontWeight: FontWeight.bold),
      );
    } else {
      return Text(
        '２人とも週間目標を\n達成できませんでした...',
        style:
            TextStyle(color: kBlack, fontSize: 30, fontWeight: FontWeight.bold),
      );
    }
  }
}
