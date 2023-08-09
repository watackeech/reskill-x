import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constant/colors.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    Key? key,
    required this.userAvatarUrl,
    required this.radius,
    required this.gradeColor ,
  }) : super(key: key);

  final String userAvatarUrl;
  final double radius;
  final Color gradeColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack( // Stackを追加
        alignment: Alignment.center, // 子要素を中央に配置
        children: [
          Shimmer.fromColors(
            baseColor: gradeColor,
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
    );
  }
}
