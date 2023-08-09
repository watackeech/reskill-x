import 'package:flutter/material.dart';
import 'package:reskill_x/constant/colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.buttonColor,
        required this.buttonTitle, required this.onTapped, required this.textStyle, this.minWidth = 200});
  final Color buttonColor;
  final String buttonTitle;
  final VoidCallback onTapped;
  final TextStyle textStyle;
  final double minWidth;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(16.0),
      elevation: 5.0,
      child: MaterialButton(
        // elevation: 2,
        onPressed: onTapped,
        minWidth: minWidth,
        height: size.height * 0.08,
        child: Text(
          buttonTitle,
          style: textStyle,
        ),
      ),
    );
  }
}
