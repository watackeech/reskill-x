import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reskill_x/view/home_screen.dart';
import 'package:reskill_x/view/login_signin_screens/login_screen.dart';
import 'package:reskill_x/view/screen_control.dart';

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
      home: SafeArea(child: LoginScreen()),
    );
  }
}
