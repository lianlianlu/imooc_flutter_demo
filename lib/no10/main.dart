import 'package:flutter/material.dart';

void main() {
  runApp(NavigatorRoute());
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('第十章 Native与Flutter混合开发'),
          ),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
//                RaisedButton(
//                  child: Text('下拉刷新'),
//                  onPressed: () {
//                    Navigator.pushNamed(context, 'downupdatelist');
//                  },
//                )
              ],
            ),
          )),
    );
  }
}

class NavigatorRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      routes: <String, WidgetBuilder>{
        // 'horizontal': (BuildContext context) => ListViewHoriz(),
      },
      home: MainPage(),
    );
  }
}
