import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reskill_x/component/main_button.dart';
import 'package:reskill_x/component/text_input_field.dart';
import 'package:reskill_x/constant/colors.dart';
import 'package:reskill_x/utils/authentication.dart';
import 'package:reskill_x/view/login_signin_screens/register_interest_screen.dart';
import 'package:reskill_x/view/screen_control.dart';

import '../../model/account.dart';
import '../../utils/firestore/user_firestore.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  File? image;
  ImagePicker picker = ImagePicker();

  Future<void> getImageFromGallery() async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  Future<String> uploadImage(String uid) async{
    print('$uid これがuid');
    final FirebaseStorage storageInstance = FirebaseStorage.instance;
    final Reference ref = storageInstance.ref();
    //ファイルのアップロード
    await ref.child(uid).putFile(image!);
    String downloadUrl = await storageInstance.ref(uid).getDownloadURL();
    print('image_pathは、: $downloadUrl');
    return downloadUrl;
  }


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
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
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
              GestureDetector(
                onTap: (){
                  print("photot selection");
                  getImageFromGallery();
                },
                child: CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.add),
                  foregroundImage: image == null ? null : FileImage(image!),
                ),
              ),
              TextInputField(
                  controller: userNameController,
                  icon: Icons.person_outlined,
                  label: 'ユーザー名'),
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
                buttonTitle: '新規登録',
                onTapped: () async {
                  if(userNameController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty && image != null){
                    var result = await Authentication.signUp(email: emailController.text, password: passwordController.text);
                    if(result is UserCredential){
                      String imagePath = await uploadImage(result.user!.uid);
                      Account newAccount = Account(
                        id: result.user!.uid,
                        name: userNameController.text,
                        userId: emailController.text,
                        imagePath: imagePath,
                        exp: 0, //新規登録したときの初期値は0
                        buddyId: 'wrQSlCkkZOQwGTNOn0PWYYu3E5R2' // ダミーデータ（古森紬）を一時的に挿入しておく
                      );
                      var _result = await UserFirestore.setUser(newAccount);
                      if(_result is Account){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterInterestScreen()));
                      }
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
                  const Text("既にアカウントをお持ちですか？"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ),
                      );
                    },
                    child: const Text("ログイン"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}
