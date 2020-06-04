import 'package:flutter/material.dart';

class LessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: '如何使用插件和包',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('statelessWidget与基础组件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                'I am Text',
                style: textStyle,
              ),
              Icon(Icons.android, size: 50, color: Colors.red),
              CloseButton(),
              BackButton(),
              Chip(avatar: Icon(Icons.people), label: Text('有趣的小部件')),
              Divider(
                height: 10, //容器的高度
                indent: 10, //左侧是高度
                thickness: 4, //分割线高度
                color: Colors.orange,
              ),
              Card(
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'I am Card',
                    style: textStyle,
                  ),
                ),
              ),
              AlertDialog(
                title: Text('盘他'),
                content: Text('你个糟老头子坏得很'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
