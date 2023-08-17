import 'package:flutter/material.dart';

import '../component/main_button.dart';
import '../constant/colors.dart';
import '../main.dart';
import '../constant/MemoProvider.dart';

class MemoButton extends StatelessWidget {
  MemoButton({super.key});

  var myMemoPro = MemoProvider();

  @override
  Widget build(BuildContext context) {
    return Material(
        child:IconButton(
          icon: Icon(Icons.edit_note),
          color: kPrime,
          iconSize: 60,
          onPressed: () {
            // _showMemoDialogメソッドを呼び出し、ダイアログを表示
            myMemoPro.showMemoDialog(memos,context);
          },
        ),
    );
  }
}
