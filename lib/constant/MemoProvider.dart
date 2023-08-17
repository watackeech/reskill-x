import 'package:flutter/material.dart';

import '../component/main_button.dart';
import '../main.dart';
import 'colors.dart';

class MemoProvider {

  void memoButton(BuildContext context){

    IconButton(
      icon: Icon(Icons.edit_note),
      color: kPrime,
      iconSize: 60,
      onPressed: () {
        // _showMemoDialogメソッドを呼び出し、ダイアログを表示
        showMemoDialog(memos,context);
      },
    );
  }

  void showMemoDialog(List<String> memoList, BuildContext context) {
  showDialog(
  context: context,
  builder: (BuildContext context) {
  return AlertDialog(
    title: Text('もやメモ',
      style: TextStyle(
      fontSize: 20,
      color: kBlack,
      fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(30.0), // 角を丸めるための値を指定
  ),
  content: Column(
  mainAxisSize: MainAxisSize.min, // コンテンツのサイズを最小に設定
  children: <Widget>[
  for (String memo in memoList)
  Padding(
  padding: const EdgeInsets.all(8.0),
  child: Text(
      memo,
    style: TextStyle(
      fontSize: 20,
      color: kBlack,
      fontWeight: FontWeight.bold,),
  ),),
  MainButton(
  buttonColor: kPrime,
  buttonTitle: '閉じる',
  onTapped: () {
  Navigator.pop(context);
  },
  textStyle: TextStyle(
  color: kWhite,
  fontWeight: FontWeight.bold,
  fontSize: 20,
  ),
  minWidth: 110,
  ),
  ],
  ),
  );
  },
  );
  }
}


