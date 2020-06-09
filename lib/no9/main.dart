import 'package:flutter/material.dart';
import 'package:imoocflutterdemo/no9/pages/downupdate_list.dart';
import 'package:imoocflutterdemo/no9/pages/gridview.dart';
import 'package:imoocflutterdemo/no9/pages/listview_expansion.dart';
import 'package:imoocflutterdemo/no9/pages/listview_horizontal.dart';
import 'package:imoocflutterdemo/no9/pages/listview_vertical.dart';
import 'package:imoocflutterdemo/no9/pages/update_list.dart';

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
            title: Text('第九章 列表组件'),
          ),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                RaisedButton(
                  child: Text('下拉刷新'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'downupdatelist');
                  },
                ),
                RaisedButton(
                  child: Text('上拉刷新'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'updatelist');
                  },
                ),
                RaisedButton(
                  child: Text('网格布局'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'gridview');
                  },
                ),
                RaisedButton(
                  child: Text('可折叠的列表'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'expansion');
                  },
                ),
                RaisedButton(
                  child: Text('水平列表滚动'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'horizontal');
                  },
                ),
                RaisedButton(
                  child: Text('竖直列表滚动'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'vertical');
                  },
                ),
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
        'horizontal': (BuildContext context) => ListViewHoriz(),
        'vertical': (BuildContext context) => ListViewVertical(),
        'expansion': (BuildContext context) => Expansion(),
        'gridview': (BuildContext context) => GridViewPage(),
        'updatelist': (BuildContext context) => UpdateList(),
        'downupdatelist': (BuildContext context) => DownUpdateList(),
      },
      home: MainPage(),
    );
  }
}
