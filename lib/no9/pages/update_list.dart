import 'package:flutter/material.dart';

class UpdateList extends StatefulWidget {
  @override
  _UpdateListState createState() => _UpdateListState();
}

class _UpdateListState extends State<UpdateList> {
  List<String> cityNames = ['北京', '上海', '南京', '深圳'];
  List<String> newCityNames = ['合肥', '广州'];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('上拉加载'),
        ),
        body: RefreshIndicator(
          //上拉刷新的widget
          onRefresh: _handleRefresh,
          child: ListView(
            children: _buildList(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    return cityNames.map((city) => _item(city)).toList();
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

  Future<void> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cityNames.addAll(newCityNames);
    });
    return null;
  }
}
