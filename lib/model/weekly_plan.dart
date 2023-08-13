import 'package:cloud_firestore/cloud_firestore.dart';

class WeeklyPlan {
  String id;
  String accountId;
  int targetHour;
  int targetMinute;
  int currentHour;
  int currentMinute;
  Timestamp? createdTime;

  WeeklyPlan({this.id = '', required this.accountId, required this.targetHour, required this.targetMinute, this.currentHour = 0, this.currentMinute = 0, this.createdTime});
}