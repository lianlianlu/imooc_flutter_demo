import 'package:flutter/material.dart';

const CITY_NAMES = {
  '北京': ['东城区', '西城区', '东城区', '东城区', '东城区', '东城区'],
  '南京': ['东城区', '东城区', '东城区', '东城区', '东城区', '东城区'],
  '广州': ['东城区', '东城区', '东城区', '东城区', '东城区', '东城区'],
};

class Expansion extends StatefulWidget {
  @override
  _ExpansionState createState() => _ExpansionState();
}

class _ExpansionState extends State<Expansion> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: AppBar(
        title: Text('可折叠列表'),
      ),
      body: ListView(
        children: _buildList(),
      ),
    ));
  }

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    CITY_NAMES.keys.forEach((key) {
      widgets.add(_item(key, CITY_NAMES[key]));
    });
    return widgets;
  }

  Widget _item(String city, List<String> subCities) {
    return ExpansionTile(
      title: Text(
        city,
        style: TextStyle(color: Colors.black54, fontSize: 20),
      ),
      children: subCities.map((subCity) => _buildSub(subCity)).toList(),
    );
  }

  Widget _buildSub(String subCity) {
    return InkWell(
      onTap: () {
        print(subCity);
      },
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(color: Colors.lightBlueAccent),
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(subCity),
          ),
        ),
      ),
    );
  }
}
