import 'package:flutter/material.dart';
import 'package:reskill_x/component/main_button.dart';
import 'package:reskill_x/constant/colors.dart';
import 'package:reskill_x/component/edit_account_screen.dart';

import '../../model/account.dart';
import '../../utils/authentication.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
            MainButton(buttonColor: kPrime, buttonTitle: "編集へ", onTapped: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditAccountScreen()));
            })
          ],
        ),
      ),
    );
  }
}
