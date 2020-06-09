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

class ListViewHoriz extends StatefulWidget {
  @override
  _ListViewHorizState createState() => _ListViewHorizState();
}

class _ListViewHorizState extends State<ListViewHoriz> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            appBar: AppBar(
              title: Text('水平滚动列表'),
            ),
            body: Container(
              height: 80,
              child: ListView(
                  scrollDirection: Axis.horizontal, children: _buildList()),
            )));
  }

  List<Widget> _buildList() {
    return CityNames.map((city) => _item(city)).toList();
  }

  Widget _item(city) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
