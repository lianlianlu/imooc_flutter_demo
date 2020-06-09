import 'package:flutter/material.dart';

const CityNames = [
  '北京',
  '上海',
  '南京',
  '深圳',
  '上海',
  '南京',
  '深圳',
  '上海',
  '南京',
  '深圳',
  '上海',
  '南京',
  '深圳'
];

class ListViewVertical extends StatefulWidget {
  @override
  _ListViewVerticalState createState() => _ListViewVerticalState();
}

class _ListViewVerticalState extends State<ListViewVertical> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            appBar: AppBar(
              title: Text('滚动列表'),
            ),
            body: Container(
              child: ListView(
                  scrollDirection: Axis.vertical, children: _buildList()),
            )));
  }

  List<Widget> _buildList() {
    return CityNames.map((city) => _item(city)).toList();
  }

  Widget _item(city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
