import 'package:flutter/material.dart';
import 'package:imoocflutterdemo/no11/navigator/tab_navigator.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: '第11章 ', home: TabNavigator());
  }
}
