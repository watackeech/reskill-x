import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:reskill_x/constant/colors.dart';

class LoadingAnimation extends StatelessWidget {
  final bool isLoading;
  LoadingAnimation({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: LoadingAnimationWidget.inkDrop(  //この部分
          color: kPrime,
          size: 100,
        ), // ここで適切なローディングアニメーションを表示
      );
    } else {
      return SizedBox.shrink(); // ローディングしない状態では非表示
    }
  }
}