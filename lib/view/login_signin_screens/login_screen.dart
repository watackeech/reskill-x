import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reskill_x/component/main_button.dart';
import 'package:reskill_x/component/text_input_field.dart';
import 'package:reskill_x/constant/colors.dart';
import 'package:reskill_x/model/account.dart';
import 'package:reskill_x/utils/authentication.dart';
import 'package:reskill_x/utils/firestore/user_firestore.dart';
import 'package:reskill_x/view/account_screens/account_screen.dart';
import 'package:reskill_x/view/login_signin_screens/signup_screen.dart';
import 'package:reskill_x/view/screen_control.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "リスキルX",
                style: TextStyle(
                    color: kPrime, fontWeight: FontWeight.w900, fontSize: 40),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                height: size.height * 0.2,
                child: Image(image: AssetImage("assets/images/giraffe.jpg")),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const SizedBox(
                height: 30,
              ),
              TextInputField(
                  controller: emailController,
                  icon: Icons.mail_outline,
                  label: 'メールアドレス'),
              TextInputField(
                  controller: passwordController,
                  icon: Icons.lock_outline,
                  label: 'パスワード'),
              MainButton(
                buttonColor: kPrime,
                buttonTitle: 'ログイン',
                onTapped: () async {
                    var result = await Authentication.login(email: emailController.text, password: passwordController.text);
                    if(result is UserCredential){
                      await UserFirestore.getUser(result.user!.uid);
                      var _result = await UserFirestore.getUser(result.user!.uid);
                      if(_result is Account){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScreenControl()));
                      }
                    }
                },
                textStyle: TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                minWidth: 110,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("まだアカウントをお持ちでないですか？"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignupScreen();
                          },
                        ),
                      );
                    },
                    child: const Text("新規登録"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
