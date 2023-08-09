import 'package:flutter/material.dart';
import 'package:reskill_x/constant/colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.buttonColor,
        required this.buttonTitle, required this.onTapped});
  final Color buttonColor;
  final String buttonTitle;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(16.0),
        elevation: 5.0,
        child: MaterialButton(
          // elevation: 2,
          onPressed: onTapped,
          minWidth: 200.0,
          height: size.height * 0.08,
          child: Text(
            buttonTitle,
            style: const TextStyle(
              color: kWhite,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
