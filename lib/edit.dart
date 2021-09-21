import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    var addText;
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        key: _formKey,
        appBar: AppBar(
          title: Text('遷移後の画面'),
        ),
        body: Column(children: [
          //入力フォーム
          Center(
            child: Container(
              child: TextFormField(
                enabled: true,
                // 入力数
                maxLength: 140,
                obscureText: false,
                maxLines: 1,
                autofocus: true,
                onChanged: (text) {
                  addText = text;
                  print(addText);
                },
                validator: (value) {
                  //_formKey.currentState.validate()でコールされる
                  if (value == null) {
                    print(value);
                    return 'hoge'; // エラー表示のメッセージを返す
                  }
                  return null;
                },
              ),
              width: 500,
            ),
          ),
          //追加ボタン
          ElevatedButton(
            onPressed: () {
              //遷移の処理を描く
              //ここで追加するかしないの状態を保つ
              if (true) {
                print("gyg");
                //print(_formKey.currentState!.validate());
                Navigator.of(context).pop(addText);
              }
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
