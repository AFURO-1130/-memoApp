import 'package:flutter/material.dart';
import 'package:flutter_application_1/edit.dart';

void main() {
  runApp(First());
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 右上に表示される"debug"ラベルを消す
      debugShowCheckedModeBanner: false,
      // アプリ名
      title: 'My Todo App',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // リスト一覧画面を表示
      home: FirstRoute(),
    );
  }
}

class FirstRoute extends StatefulWidget {
  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  List todoList = [];

  @override
  Widget build(BuildContext context) {
    return

     Scaffold(
        appBar: AppBar(
          title: Text("ホーム"),
        ),
        body: Column(
          children: [
            Container(
              child: ElevatedButton(
                onPressed: () async {
                  // "push"で新規画面に遷移
                  // リスト追加画面から渡される値を受け取る
                  var newListText = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                  //追加画面から受け取り確認
                  print(newListText);
                  if (newListText != null ) {
                    // キャンセルした場合は newListText が null となるので注意
                    setState(() {
                      // リスト追加
                      todoList.add(newListText);
                    });
                  }
                  
                },
                child: Icon(Icons.add),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(todoList[index]),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
