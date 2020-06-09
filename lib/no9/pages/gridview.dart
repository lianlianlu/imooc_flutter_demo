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

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: AppBar(
        title: Text('网格布局'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: _buildList(),
      ),
    ));
  }

  List<Widget> _buildList() {
    return CityNames.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
