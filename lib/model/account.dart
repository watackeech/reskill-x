import 'package:cloud_firestore/cloud_firestore.dart';

class Account{
  String id;
  String name;
  String imagePath;
  String userId;
  Timestamp? createdTime;
  Timestamp? updatedTime;
  Timestamp? latestGoalDate;
  int exp;
  String buddyId;

  Account({required this.id, required this.name, required this.userId, this.imagePath = '', this.createdTime, this.updatedTime, required this.exp, this.latestGoalDate, this.buddyId = ""});
}