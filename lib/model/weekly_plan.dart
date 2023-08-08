import 'package:cloud_firestore/cloud_firestore.dart';

class WeeklyPlan {
  String id;
  String accountId;
  int hour;
  int currentHour;
  Timestamp? createdTime;

  WeeklyPlan({this.id = '', required this.accountId, required this.hour, this.currentHour = 0, this.createdTime});
}