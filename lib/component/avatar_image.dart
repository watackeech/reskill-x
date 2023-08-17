import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constant/GradeControl.dart';
import '../constant/colors.dart';

class AvatarImage extends StatelessWidget {
   AvatarImage({
    Key? key,
    required this.userAvatarUrl,
    required this.radius,
    required this.exp ,
    required this.avatarTitle,
  }) : super(key: key);

  final String userAvatarUrl;
  final double radius;
  final int exp;
  final String avatarTitle;

  var myGradeControl = GradeControl();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
        alignment: Alignment.topLeft,
        children:[
          Stack( // Stackを追加
            alignment: Alignment.center, // 子要素を中央に配置
            children: [
              Shimmer.fromColors(
                baseColor: myGradeControl.getGradeColor(exp),
                highlightColor: Colors.white,
                child: Container(
                  height: size.width * radius * 2,
                  width: size.width * radius * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.brown,
                  ),
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(userAvatarUrl),
                radius: size.width * radius * 0.8,
              ),
            ],
          ),
          if (avatarTitle != '') Container(
              alignment: Alignment.center,
              width:60,
              height:20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kPrime,
              ),
              child:Text(avatarTitle,
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
              )
          )
        ]
    );

  }
}
