import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reskill_x/utils/authentication.dart';

import '../../model/account.dart';

class UserFirestore {
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users =
      _firestoreInstance.collection('users');

  static Future<dynamic> setUser(Account newAccount) async {
    try {
      await users.doc(newAccount.id).set({
        'name': newAccount.name,
        'user_id': newAccount.userId,
        'image_path': newAccount.imagePath,
        'created_time': Timestamp.now(),
        'updated_time': Timestamp.now()
      });
      return getUser(newAccount.id);
    } on FirebaseException catch (e) {
      print('setUser関数でエラーが起きました！: $e');
    }
  }

  static Future<dynamic> getUser(String uid) async {
    try {
      DocumentSnapshot documentSnapshot = await users.doc(uid).get();
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      Account myAccount = Account(
          id: uid,
          name: data['name'],
          userId: data['user_id'],
          imagePath: data['image_path'],
          createdTime: data['created_time'],
          updatedTime: data['updated_time'],
          exp: data['exp']);
      Authentication.myAccount = myAccount;
      return myAccount;
    } on FirebaseException catch (e) {
      print('Firebaseのユーザー情報取得でエラーが起きました！: $e');
      return false;
    }
  }
}
