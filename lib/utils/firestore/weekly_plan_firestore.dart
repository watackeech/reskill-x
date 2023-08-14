import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/weekly_plan.dart';

class WeeklyPlanFirestore{
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference weeklyPlans = _firestoreInstance.collection('weekly_plans');

  static Future<dynamic> addWeeklyPlan(WeeklyPlan newWeeklyPlan) async {
    try {
      // final CollectionReference userWeeklyPlans = _firestoreInstance.collection('users').doc(newWeeklyPlan.accountId).collection('weekly_plans');
      var result = await weeklyPlans.add({
        'account_id': newWeeklyPlan.accountId,
        'target_hour': newWeeklyPlan.targetHour,
        'target_minute': newWeeklyPlan.targetMinute,
        'current_hour': 0,
        'current_minute': 0,
        'created_time': Timestamp.now()
      });
      // userWeeklyPlans.doc(result.id).set({
      //   'weekly_plan_id': result.id,
      //   'created_time': Timestamp.now()
      // });
      print('投稿完了');
      return true;
    } on FirebaseException catch(e) {
      print('学習計画設定エラー: $e');
      return false;
    }
  }

  static Future<dynamic> updateWeeklyPlan(String accountId, int addingHour, int addingMinuteRaw) async {
    try {
      QuerySnapshot querySnapshot = await weeklyPlans
          .where('account_id', isEqualTo: accountId)
          .orderBy('created_time', descending: true)
          .limit(1)
          .get();
      QueryDocumentSnapshot documentSnapshot = querySnapshot.docs[0];
      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
      print('ターゲット時間');
      print(data['target_hour']);
      print(data['current_minute']);

      WeeklyPlan latestWeeklyPlan = WeeklyPlan(
          accountId: (accountId),
          targetHour: data['target_hour'],
          targetMinute: data['target_minute'],
          currentHour: data['current_hour'],
          currentMinute: data['current_minute']
      );

      int addingMinute = latestWeeklyPlan.currentMinute + addingMinuteRaw;
      if(addingMinute > 45){
        addingHour++;
        addingMinute = addingMinute % 60;
      }

      documentSnapshot.reference.update({
        'account_id': accountId,
        'target_hour': latestWeeklyPlan.targetHour,
        'target_minute': latestWeeklyPlan.targetMinute,
        'current_hour': latestWeeklyPlan.currentHour + addingHour,
        'current_minute': addingMinute
      });
      print('学習進捗登録完了！');
      return true;
    } on FirebaseException catch(e) {
      print('学習進捗登録エラー');
      return false;
    }
  }

  static Future<dynamic> getWeeklyPlansFromIds(String accountId) async{
    List<Map<String, dynamic>> weeklyPlanList = [];
    try{
      QuerySnapshot querySnapshot = await weeklyPlans
          .where('account_id', isEqualTo: accountId)
          .orderBy('created_time', descending: true)
          .limit(4)
          .get();
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        weeklyPlanList.add(data);
        print('ターゲット時間');
        print(data['target_hour']);
      });
      return weeklyPlanList;
    } on FirebaseException catch(e) {
      print('学習進捗取得エラー');
      return false;
    }
  }
}