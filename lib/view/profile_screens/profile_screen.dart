import 'package:flutter/material.dart';
import 'package:reskill_x/component/main_button.dart';
import 'package:reskill_x/constant/colors.dart';
import '../../model/account.dart';
import '../../utils/authentication.dart';
import 'package:reskill_x/component/avatar_image.dart';


class IconText extends StatelessWidget {
  const IconText({super.key, required this.icon, required this.text});
  final String text;
  final IconData? icon;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: kPrime,),
        Text(text)
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AvatarImage(userAvatarUrl: myAccount.imagePath,
                  radius: 0.3,
                  gradeColor: kBronze),
              Text('${myAccount.userId}'),
              Text('${myAccount.name}'),


              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconText(icon: Icons.flag, text: '現在のリスキル経験値：'),
                    IconText(icon: Icons.batch_prediction, text: 'グレード：'),
                    IconText(icon: Icons.stairs, text: '次のグレードまで：あと'),
                    IconText(icon: Icons.search, text: '興味関心'),
                  ],
                ),
              ),

              MainButton(
                buttonColor: kPrime,
                buttonTitle: '面談ログ',
                onTapped: (){},
                textStyle: TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                minWidth: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
