import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/weekly_plan.dart';

class WeeklyPlanFirestore{
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference weeklyPlans = _firestoreInstance.collection('weekly_plans');

  static Future<dynamic> addWeeklyPlan(WeeklyPlan newWeeklyPlan) async {
    try {
      final CollectionReference userWeeklyPlans = _firestoreInstance.collection('users').doc(newWeeklyPlan.accountId).collection('weekly_plans');
      var result = await weeklyPlans.add({
        'account_id': newWeeklyPlan.accountId,
        'hour': newWeeklyPlan.hour,
        'currentHour': newWeeklyPlan.currentHour,
        'created_time': Timestamp.now()
      });
      userWeeklyPlans.doc(result.id).set({
        'weekly_plan_id': result.id,
        'created_time': Timestamp.now()
      });
      print('投稿完了');
      return true;
    } on FirebaseException catch(e) {
      print('学習計画設定エラー: $e');
      return false;
    }
  }
}