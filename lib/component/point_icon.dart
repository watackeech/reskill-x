import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'avatar_image.dart';

class PointIcon extends StatelessWidget {
  const PointIcon({super.key, required this.imageUrl, required this.gradeColor, required this.exp});
  final String imageUrl;
  final Color gradeColor;
  final int exp;


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width:170,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: kPrime,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10,),
              Icon(Icons.stars, color:Colors.yellow,),
              Text('${exp}exp', style:TextStyle(color:Colors.white, fontSize: 20)),
              // Container(
              //   width: 50,
              //   height: 50,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: Colors.white,
              //
              //   )
              // )
            ],
          ),
        ),
        AvatarImage(userAvatarUrl: imageUrl, gradeColor: gradeColor, radius: 0.065,),
      ],
    );
  }
}
