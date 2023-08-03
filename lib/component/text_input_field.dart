import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/text_style.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({super.key,
    required this.controller,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width * 0.8,
        // height: size.height * 0.08,
        child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: label,
              prefixIcon: Icon(icon, size: 28, color: kGrey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )),
      ),
    );
  }
}