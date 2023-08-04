import 'package:cloud_firestore/cloud_firestore.dart';

class Account{
  String id;
  String name;
  String imagePath;
  String userId;
  Timestamp? createdTime;
  Timestamp? updatedTime;

  Account({required this.id, required this.name, required this.userId, this.imagePath = '', this.createdTime, this.updatedTime});
}