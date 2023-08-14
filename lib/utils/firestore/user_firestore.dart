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
        'updated_time': Timestamp.now(),
        'exp': newAccount.exp,
        'buddy_id': newAccount.buddyId
      });
      return getUser(newAccount.id);
    } on FirebaseException catch (e) {
      print('setUser関数でエラーが起きました！: $e');
    }
  }

  static Future<dynamic> getUser(String uid) async {
    //uidがemptyだった場合にエラーが起きるのを防ぐearly return
    if(uid.isEmpty){
      return false;
    }
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
          exp: data['exp'],
          buddyId: data['buddy_id']
      );
      Authentication.myAccount = myAccount;

      DocumentSnapshot documentSnapshotForBuddy = await users.doc(data['buddy_id']).get();
      Map<String, dynamic> dataOfBuddy =
      documentSnapshotForBuddy.data() as Map<String, dynamic>;
      Account buddyAccount = Account(
          id: data['buddy_id'],
          name: dataOfBuddy['name'],
          userId: dataOfBuddy['user_id'],
          imagePath: dataOfBuddy['image_path'],
          createdTime: dataOfBuddy['created_time'],
          updatedTime: dataOfBuddy['updated_time'],
          exp: dataOfBuddy['exp'],
          buddyId: dataOfBuddy['buddy_id']
      );
      Authentication.buddyAccount = buddyAccount;
      return myAccount;

      return myAccount;
    } on FirebaseException catch (e) {
      print('Firebaseのユーザー情報取得でエラーが起きました！: $e');
      return false;
    }
  }

  static Future<dynamic> getBuddy(String uid) async {
    //uidがemptyだった場合にエラーが起きるのを防ぐearly return
    if(uid.isEmpty){
      return false;
    }
    try {
      DocumentSnapshot documentSnapshot = await users.doc(uid).get();
      Map<String, dynamic> data =
      documentSnapshot.data() as Map<String, dynamic>;
      Account buddyAccount = Account(
          id: uid,
          name: data['name'],
          userId: data['user_id'],
          imagePath: data['image_path'],
          createdTime: data['created_time'],
          updatedTime: data['updated_time'],
          exp: data['exp'],
          buddyId: data['buddy_id']
      );
      Authentication.buddyAccount = buddyAccount;
      return buddyAccount;
    } on FirebaseException catch (e) {
      print('Firebaseのユーザー情報取得でエラーが起きました！: $e');
      return false;
    }
  }
}
