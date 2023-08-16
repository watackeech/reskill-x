import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reskill_x/constant/interested_field.dart';
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

  static Future<dynamic> updateExp(String accountId, int targetHour, int targetMinute) async {
    try {
      DocumentSnapshot documentSnapshot = await users.doc(accountId).get();
      Map<String, dynamic> data =
      documentSnapshot.data() as Map<String, dynamic>;
      int addingExp = targetHour * 60 + targetMinute;
      int latestExp = data['exp'] + addingExp;
      print('accountIdは：$accountId');
      print('最新のExpは：$latestExp');
      print('addingExpは：$addingExp');

      users.doc(accountId).update({
        'exp': latestExp
      });
      print('exp更新完了！');
      return true;
    } on FirebaseException catch(e) {
      print('exp更新エラー');
      return false;
    }
  }
  static Future<int> getExp(String accountId) async {
    try {
      DocumentSnapshot documentSnapshot = await users.doc(accountId).get();
      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
      print('exp取得録完了！');
      return data['exp'];
    } on FirebaseException catch(e) {
      print('exp取得エラー');
      return -1;
    }
  }

  static Future<bool> setInterest(String accountId, List<String>? interestedField) async {
    if(interestedField == null){
      return false;
    }
    try{
      CollectionReference interestFieldCollection = users.doc(accountId).collection('interest_field');
      List<String> fieldOptions = InterestedField().fieldOptions;
      for(int i = 0; i < interestedField.length; i++){
        await interestFieldCollection.doc('${interestedField[i]}').set({
          'field_id': interestedField[i],
          'field_name': fieldOptions[i],
        });
      }
      print('興味分野登録完了！');
      return true;
    } on FirebaseException catch(e) {
      print('興味分野登録エラー: $e');
      return false;
    }
  }

  static Future<List<Map<String, dynamic>>> getInterestFields(String accountId) async {
    print('アカウントのIDは：$accountId');
    try {
      CollectionReference interestFieldCollection = users.doc(accountId).collection('interest_field');
      QuerySnapshot querySnapshot = await interestFieldCollection.orderBy('field_id').get();

      List<Map<String, dynamic>> interestFields = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      print(interestFields);
      print('興味分野１は、${interestFields[0]['field_name']}');
      return interestFields;
    } on FirebaseException catch(e) {
      print('興味分野取得エラー: $e');
      return [];
    }
  }

}
