import 'package:flutter/material.dart';
import 'package:reskill_x/component/main_button.dart';
import 'package:reskill_x/constant/colors.dart';
import '../../model/account.dart';
import '../../utils/authentication.dart';
import 'package:reskill_x/component/avatar_image.dart';

import '../../utils/firestore/user_firestore.dart';


class IconText extends StatelessWidget {
  const IconText({super.key, required this.icon, required this.text, required this.widget});
  final String text;
  final IconData? icon;
  final Widget widget;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: kPrime,),
        Text(text),
        widget
      ],
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String route = '/profile/profile_screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Account myAccount = Authentication.myAccount!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: size.height * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AvatarImage(userAvatarUrl: myAccount.imagePath,
                  radius: 0.3,
                  gradeColor: kBronze),
              Column(
                children: [
                  Text('${myAccount.name}', style: TextStyle(fontSize: 30),),
                  Text('${myAccount.userId}'),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconText(icon: Icons.flag, text: '現在のリスキル経験値：', widget:
                      Text('${myAccount.exp}')
                      ,),
                    IconText(icon: Icons.batch_prediction, text: 'グレード：', widget: Text(
                      'ブロンズ'
                    )),
                    IconText(icon: Icons.stairs, text: '次のグレードまで：あと', widget: Text(
                        '100exp'
                    )),
                    IconText(icon: Icons.search, text: '興味関心：', widget:
                    FutureBuilder<List<Map<String, dynamic>>>(
                      future: UserFirestore.getInterestFields(myAccount.id),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('エラーが発生しました: ${snapshot.error}');
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Text('データがありません');
                        } else {
                          List<Map<String, dynamic>> interestFields = snapshot.data!;
                          return buildInterestFields(interestFields);
                        }
                      },
                    ),),

                  ],
                ),
              ),

              // MainButton(
              //   buttonColor: kPrime,
              //   buttonTitle: '面談ログ',
              //   onTapped: (){},
              //   textStyle: TextStyle(
              //     color: kWhite,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 16,
              //   ),
              //   minWidth: 200,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Text buildInterestFields(List<Map<String, dynamic>> interestFields) {
    if (interestFields.length > 2) {
      // 3件以上の場合は「...」をつけて表示
      List<String> interestNames = interestFields
          .map((field) => field['field_name'] as String)
          .take(2)
          .toList();
      interestNames.add('...');

      return Text(interestNames.join(', '));
    } else {
      // 2件以下の場合は全て横並びで表示
      List<String> interestNames = interestFields
          .map((field) => field['field_name'] as String)
          .toList();

      return Text(interestNames.join(', '));
    }
  }
}
