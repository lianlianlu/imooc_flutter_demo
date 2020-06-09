import 'package:flutter/material.dart';

class DownUpdateList extends StatefulWidget {
  @override
  _DownUpdateListState createState() => _DownUpdateListState();
}

class _DownUpdateListState extends State<DownUpdateList> {
  List<String> cityNames = ['北京', '上海', '南京', '深圳', '合肥', '广州', '你好', '我好'];
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('下拉加载'),
        ),
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView(
            controller: _scrollController,
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
    return null;
  }

  void _loadData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      List<String> list = List<String>.from(cityNames); //复制一份数组
      list.addAll(cityNames);
      cityNames = list;
    });
  }
}
