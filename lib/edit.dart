import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    var addText;
    return Scaffold(
            appBar: AppBar(
              title: Text('遷移後の画面'),
            ),
            body: Column(children: [
              //入力フォーム
              Center(
                child: Container(
                  child: TextField(
                    onChanged: (text) {
                        addText = text;
                        print(addText);
                    },
                  ),
                  width: 500,
                ),
              ),
              //追加ボタン
              ElevatedButton(
                onPressed: () {
                  //遷移の処理を描く
                  Navigator.of(context).pop(addText);
                },
                child: Text("追加する"),
              ),
              ElevatedButton(
            onPressed: () {
              //遷移の処理を描く
              Navigator.of(context).pop();
            },
            child: Text("キャンセル"),
          ),
            ]));
  }
}
