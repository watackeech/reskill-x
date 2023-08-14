import 'package:flutter/material.dart';
import 'package:reskill_x/view/goal_screans/study_record_screen.dart';
import '../monthly_report_screen.dart';
import '../set_goal_form_screen.dart';
import '../weekly_report_screen.dart';
import 'goal_screen.dart';

final homeKey = GlobalKey<NavigatorState>();

class GoalControl extends StatelessWidget {
  GoalControl({super.key});


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Navigator(
        key: homeKey,
        initialRoute: GoalScreen.route,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          //statusについて
          // 1：１週目かつ学習計画が設定されていない状態
          // 2：２～４週目かつ学習計画が設定されていない状態
          // 3：学習計画が設定されているかつ期日当日でない状態
          // 4：学習計画が設定されているかつ期日当日である状態
          // 5: 学習計画が設定されているかつ期日当日であるかつ4週目である状態
          // 最終的にはテーブルに格納されている学習計画設定日と現在の日付から状態を判別する
          int status = 3;

          switch (status) {
            case 1:
              builder = (BuildContext _) => SetGoalFormScreen();
              break;
            case 2:
              builder = (BuildContext _) => GoalScreen();
              break;
            case 3:
              builder = (BuildContext _) => StudyRecordScreen();
              break;
            case 4:
              builder = (BuildContext _) => WeeklyReportScreen();
              break;
            case 5:
              builder = (BuildContext _) => MonthlyReportScreen();
              break;
            default:
              builder = (BuildContext _) => GoalControl();
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}
