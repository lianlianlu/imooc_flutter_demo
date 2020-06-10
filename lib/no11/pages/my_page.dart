import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String countString = '';
  String localCount = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('测试'),
        ),
        body: Column(
          children: [
            RaisedButton(
              onPressed: _incrementCounter,
              child: Text('increment count'),
            ),
            RaisedButton(
              onPressed: _getCounter,
              child: Text('get counter'),
            ),
            Text(
              countString,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              localCount,
              style: TextStyle(fontSize: 20),
            )
          ],
        ));
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      //显示的内容加1
      countString = countString + ' 1';
    });
    //从本地取到上次的结果
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter', counter);
  }

  _getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      //显示的内容加1
      localCount = prefs.getInt('counter').toString();
    });
  }
}
