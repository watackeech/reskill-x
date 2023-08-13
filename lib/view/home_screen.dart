import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:reskill_x/component/avatar_image.dart';
import 'package:reskill_x/component/due_date.dart';
import 'package:reskill_x/component/main_button.dart';
import 'package:reskill_x/utils/firestore/user_firestore.dart';
import 'package:reskill_x/utils/firestore/weekly_plan_firestore.dart';

import '../component/alert_dialog.dart';
import '../component/circular_progress_bar.dart';
import '../component/point_icon.dart';
import '../constant/colors.dart';
import '../model/account.dart';
import '../utils/authentication.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //statusについて
  // 1：１週目かつ学習計画が設定されていない状態
  // 2：２～４週目かつ学習計画が設定されていない状態
  // 3：学習計画が設定されているかつ期日当日でない状態
  // 4：学習計画が設定されているかつ期日当日である状態
  // 最終的にはテーブルに格納されている学習計画設定日と現在の日付から状態を判別する
  int status = 1;


  Account myAccount = Authentication.myAccount!;
  Account buddyAccount = Authentication.buddyAccount!;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   myAccount = Authentication.myAccount!;
  //   buddyAccount = UserFirestore.getUser(myAccount.buddyId);
  // }

  // Future<void> _loadBuddyAccount() async {
  //   final loadedBuddyAccount = await UserFirestore.getUser(myAccount.buddyId) as Account;
  //   setState(() {
  //     buddyAccount = loadedBuddyAccount;
  //   }); // UIを更新
  // }

  @override
  Widget build(BuildContext context) {

    String alertMessage = 'test';
    if(status == 1 || status == 2){
        alertMessage = '今週の目標時間を設定してください';
    }
            return Scaffold(
              body: Center(
                child: Column(
                  children: [
                    const Text("目標期日まで"),
                    const SizedBox(
                      height: 10,
                    ),
                    DueDate(),
                    Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AvatarImage(userAvatarUrl: myAccount.imagePath, radius: 0.2, gradeColor: kBronze),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AvatarImage(userAvatarUrl: buddyAccount.imagePath, radius: 0.2, gradeColor: kBronze),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FutureBuilder(
                            future: WeeklyPlanFirestore.getWeeklyPlansFromIds(myAccount.id),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.data.isNotEmpty) {
                                List<Map<String, dynamic>> weeklyPlanList = snapshot.data;
                                return CircularProgressBar(
                                    targetHour: weeklyPlanList[0]['target_hour'].round(),
                                    targetMinute: weeklyPlanList[0]['target_minute'].round(),
                                    currentHour: weeklyPlanList[0]['current_hour'].round(),
                                    currentMinute: weeklyPlanList[0]['current_minute'].round()
                                );
                              } else { //まだ学習計画を立てていなかったとき
                                return CircularProgressBar(
                                    targetHour: 0,
                                    targetMinute: 0,
                                    currentHour: 0,
                                    currentMinute: 0
                                );
                              }
                            }
                        ),
                        FutureBuilder(
                            future: WeeklyPlanFirestore.getWeeklyPlansFromIds(buddyAccount.id),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.data.isNotEmpty) {
                                List<Map<String, dynamic>> weeklyPlanList = snapshot.data;
                                return CircularProgressBar(
                                    targetHour: weeklyPlanList[0]['target_hour'].round(),
                                    targetMinute: weeklyPlanList[0]['target_minute'].round(),
                                    currentHour: weeklyPlanList[0]['current_hour'].round(),
                                    currentMinute: weeklyPlanList[0]['current_minute'].round()
                                );
                              } else {
                                return CircularProgressBar(
                                    targetHour: 0,
                                    targetMinute: 0,
                                    currentHour: 0,
                                    currentMinute: 0
                                );
                              }
                            }
                        ),
                      ],
                    ),
                    Text(alertMessage,
                      style: TextStyle(color: kPrime),
                    ),
                  ],
                ),
              ),);


    // return FutureBuilder<dynamic>(
    //     future: buddyAccount,
    //     builder: (context, snapshot){
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return CircularProgressIndicator(); // データ取得中の表示
    //       } else if (snapshot.hasError) {
    //         return Text('Error: ${snapshot.error}');
    //       } else if (snapshot.hasData && snapshot.data is Account) {
    //         Account buddyData = snapshot.data as Account;
    //         return Scaffold(
    //           body: Center(
    //             child: Column(
    //               children: [
    //                 const Text("目標期日まで"),
    //                 const SizedBox(
    //                   height: 10,
    //                 ),
    //                 DueDate(),
    //                 Padding(
    //                   padding: const EdgeInsets.only(top:20.0),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.all(8.0),
    //                         child: AvatarImage(userAvatarUrl: myAccount.imagePath, radius: 0.2, gradeColor: kBronze),
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.all(8.0),
    //                         child: AvatarImage(userAvatarUrl: buddyData.imagePath, radius: 0.2, gradeColor: kBronze),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     FutureBuilder(
    //                         future: WeeklyPlanFirestore.getPostsFromIds(myAccount.id),
    //                         builder: (context, snapshot) {
    //                           if (snapshot.connectionState == ConnectionState.waiting) {
    //                             return CircularProgressIndicator();
    //                           } else if (snapshot.hasError) {
    //                             return Text('Error: ${snapshot.error}');
    //                           } else if (snapshot.data.isNotEmpty) {
    //                             List<Map<String, dynamic>> weeklyPlanList = snapshot.data;
    //                             return CircularProgressBar(
    //                                 targetHour: weeklyPlanList[0]['target_hour'].round(),
    //                                 targetMinute: weeklyPlanList[0]['target_minute'].round(),
    //                                 currentHour: weeklyPlanList[0]['current_hour'].round(),
    //                                 currentMinute: weeklyPlanList[0]['current_minute'].round()
    //                             );
    //                           } else { //まだ学習計画を立てていなかったとき
    //                             return CircularProgressBar(
    //                                 targetHour: 0,
    //                                 targetMinute: 0,
    //                                 currentHour: 0,
    //                                 currentMinute: 0
    //                             );
    //                           }
    //                         }
    //                     ),
    //                     FutureBuilder(
    //                         future: WeeklyPlanFirestore.getPostsFromIds(buddyData.id),
    //                         builder: (context, snapshot) {
    //                           if (snapshot.connectionState == ConnectionState.waiting) {
    //                             return CircularProgressIndicator();
    //                           } else if (snapshot.hasError) {
    //                             return Text('Error: ${snapshot.error}');
    //                           } else if (snapshot.data.isNotEmpty) {
    //                             List<Map<String, dynamic>> weeklyPlanList = snapshot.data;
    //                             return CircularProgressBar(
    //                                 targetHour: weeklyPlanList[0]['target_hour'].round(),
    //                                 targetMinute: weeklyPlanList[0]['target_minute'].round(),
    //                                 currentHour: weeklyPlanList[0]['current_hour'].round(),
    //                                 currentMinute: weeklyPlanList[0]['current_minute'].round()
    //                             );
    //                           } else {
    //                             return CircularProgressBar(
    //                                 targetHour: 0,
    //                                 targetMinute: 0,
    //                                 currentHour: 0,
    //                                 currentMinute: 0
    //                             );
    //                           }
    //                         }
    //                     ),
    //                   ],
    //                 ),
    //                 Text(alertMessage,
    //                   style: TextStyle(color: kPrime),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       } else { // バディの情報取得に失敗した場合（バディ未設定など）
    //         return Scaffold(
    //           body: Center(
    //             child: Column(
    //               children: [
    //                 const Text("目標期日まで"),
    //                 const SizedBox(
    //                   height: 10,
    //                 ),
    //                 DueDate(),
    //                 Padding(
    //                   padding: const EdgeInsets.only(top:20.0),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.all(8.0),
    //                         child: AvatarImage(userAvatarUrl: myAccount.imagePath, radius: 0.2, gradeColor: kBronze),
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.all(8.0),
    //                         child: AvatarImage(userAvatarUrl: "https://www.martela.com/sites/default/files/styles/material_gallery_thumb/public/pim2022_files/MU43_light_grey_melamine_fullHD.jpeg", radius: 0.2, gradeColor: kBlack),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     FutureBuilder(
    //                         future: WeeklyPlanFirestore.getPostsFromIds(myAccount.id),
    //                         builder: (context, snapshot) {
    //                           if (snapshot.connectionState == ConnectionState.waiting) {
    //                             return CircularProgressIndicator();
    //                           } else if (snapshot.hasError) {
    //                             return Text('Error: ${snapshot.error}');
    //                           } else if (snapshot.data.isNotEmpty) {
    //                             List<Map<String, dynamic>> weeklyPlanList = snapshot.data;
    //                             return CircularProgressBar(
    //                                 targetHour: weeklyPlanList[0]['target_hour'].round(),
    //                                 targetMinute: weeklyPlanList[0]['target_minute'].round(),
    //                                 currentHour: weeklyPlanList[0]['current_hour'].round(),
    //                                 currentMinute: weeklyPlanList[0]['current_minute'].round()
    //                             );
    //                           } else { //まだ学習計画を立てていなかったとき
    //                             return CircularProgressBar(
    //                                 targetHour: 0,
    //                                 targetMinute: 0,
    //                                 currentHour: 0,
    //                                 currentMinute: 0
    //                             );
    //                           }
    //                         }
    //                     ),
    //                     FutureBuilder(
    //                         future: WeeklyPlanFirestore.getPostsFromIds(myAccount.id),
    //                         builder: (context, snapshot) {
    //                           if (snapshot.connectionState == ConnectionState.waiting) {
    //                             return CircularProgressIndicator();
    //                           } else if (snapshot.hasError) {
    //                             return Text('Error: ${snapshot.error}');
    //                           } else if (snapshot.data.isNotEmpty) {
    //                             List<Map<String, dynamic>> weeklyPlanList = snapshot.data;
    //                             return CircularProgressBar(
    //                                 targetHour: weeklyPlanList[0]['target_hour'].round(),
    //                                 targetMinute: weeklyPlanList[0]['target_minute'].round(),
    //                                 currentHour: weeklyPlanList[0]['current_hour'].round(),
    //                                 currentMinute: weeklyPlanList[0]['current_minute'].round()
    //                             );
    //                           } else {
    //                             return CircularProgressBar(
    //                                 targetHour: 0,
    //                                 targetMinute: 0,
    //                                 currentHour: 0,
    //                                 currentMinute: 0
    //                             );
    //                           }
    //                         }
    //                     ),
    //                   ],
    //                 ),
    //                 Text(alertMessage,
    //                   style: TextStyle(color: kPrime),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       }
    //     }
    // );



  }
}
