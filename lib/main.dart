import 'package:flutter/material.dart';
import 'package:imoocflutterdemo/flutter_layout_page.dart';
import 'package:imoocflutterdemo/less_group_page.dart';
import 'package:imoocflutterdemo/plugin_use.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('路由'),
          ),
          body: RouteNavigator()),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroupPage(),
        'full': (BuildContext context) => FlutterLayoutPage(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'plugin': (BuildContext context) => PluginUse(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  RouteNavigator({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RouteNavigatortate createState() => _RouteNavigatortate();
}

class _RouteNavigatortate extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SwitchListTile(
          title: Text('${byName ? "" : '不'}通过路由名跳转'),
          value: byName,
          onChanged: (value) {
            setState(() {
              byName = value;
            });
          },
        ),
        _item('statelessWidget', LessGroupPage(), 'less'),
        _item('FlutterLayoutPage', FlutterLayoutPage(), 'full'),
        _item('FlutterLayoutPage', FlutterLayoutPage(), 'layout'),
        _item('PluginUse', PluginUse(), 'plugin')
      ]),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
