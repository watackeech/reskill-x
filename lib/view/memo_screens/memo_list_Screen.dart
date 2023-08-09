import 'package:flutter/material.dart';
import 'package:reskill_x/component/main_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/colors.dart';


class MemoListScreen extends StatefulWidget {
   MemoListScreen({super.key});

  @override
  State<MemoListScreen> createState() => _MemoListScreenState();
}

class _MemoListScreenState extends State<MemoListScreen> {

  // メモデータ
  List<String> _memos = [];
  //テキストフィールドを制御
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadMemos();
  }

  // メモ読み込み
  Future<void> _loadMemos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _memos = prefs.getStringList('memos') ?? [];
    });
  }

  //メモ保存
  Future<void> _saveMemos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('memos', _memos);
  }

  //メモ追加
  void _addMemo(String memo) {
    setState(() {
      _memos.add(memo);
      _saveMemos();
    });
  }

  //メモ消去
  void _deleteMemo(int index) {
    setState(() {
      _memos.removeAt(index);
      _saveMemos();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('もやメモ'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cloud),
            onPressed: () {
              // アイコンが押されたときの処理
              print('Search icon pressed');
            },
          ),
        ],
      ),
      body: SizedBox(
    height: size.height * 0.76,
    child:Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _memos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_memos[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteMemo(index);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.multiline, // 全角入力を可能にする
              maxLines: null,
              decoration: InputDecoration(labelText: 'メモを入力してください'),
            ),
          ),
          MainButton(
            buttonTitle: 'メモ保存',
            buttonColor: kPrime,
            onTapped: () {
              String memo = _textEditingController.text;
              if (memo.isNotEmpty) {
                _addMemo(memo);
                _textEditingController.clear();
              }
            },
            textStyle: TextStyle(
              color: kWhite,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            minWidth: 90,
          ),
        ],
      ),
      ),
    );
  }
}
