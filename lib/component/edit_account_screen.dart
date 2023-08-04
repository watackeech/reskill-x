import 'package:flutter/material.dart';
import 'package:reskill_x/component/main_button.dart';
import 'package:reskill_x/constant/colors.dart';

import '../model/account.dart';
import '../utils/authentication.dart';
import '../view/account_screens/account_screen.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  Account myAccount = Authentication.myAccount!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('${myAccount.userId}'),
            Text('${myAccount.name}'),
            CircleAvatar(
              radius: 40,
              foregroundImage: NetworkImage(myAccount.imagePath),
              child: Icon(Icons.add),
            ),
            MainButton(buttonColor: kPrime, buttonTitle: "アカウントスクリーンへ", onTapped: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen()));
            })
          ],
        ),
      ),
    );
  }
}
