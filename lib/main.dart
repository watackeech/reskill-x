import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reskill_x/view/home_screen.dart';
import 'package:reskill_x/view/login_signin_screens/login_screen.dart';
import 'package:reskill_x/view/login_signin_screens/register_interest_screen.dart';
import 'package:reskill_x/view/login_signin_screens/signup_screen.dart';
import 'package:reskill_x/view/screen_control.dart';

//patternについて
// 0: 何も表示しない
// 1：１週目の初日かつ学習計画が設定されていない状態
// 2：２～４週目、6～8週目の初日かつ学習計画が設定されていない状態
// 3：学習計画が設定されているかつ1～3週目、5～7週目の期日である状態
// 4：学習計画が設定されているかつ４週目の期日当日である状態
// 5：学習計画が設定されているかつ8週目の期日当日である状態
// 最終的にはテーブルに格納されている学習計画設定日と現在の日付から状態を判別する
int pattern = 1;
String done = 'no';
List<String> memos = [];

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reskill_X',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      //SafeAreaにすることで日付表示などに被らない
      // home: SafeArea(child: LoginScreen()),
      home: SafeArea(child: LoginScreen()),
    );
  }
}
