import 'package:flutter/material.dart';
import 'package:imoocflutterdemo/app_lifecycle.dart';
import 'package:imoocflutterdemo/flutter_layout_page.dart';
import 'package:imoocflutterdemo/flutter_widget_lifecycle.dart';
import 'package:imoocflutterdemo/gesture_page.dart';
import 'package:imoocflutterdemo/launch_page.dart';
import 'package:imoocflutterdemo/less_group_page.dart';
import 'package:imoocflutterdemo/no6/image_page.dart';
import 'package:imoocflutterdemo/photo_app_page.dart';
import 'package:imoocflutterdemo/plugin_use.dart';
import 'package:imoocflutterdemo/resource_page.dart';
import 'package:imoocflutterdemo/statefull_group_page.dart';

void main() {
  runApp(DynamicTheme());
}

class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Lato', //将字体运用到全局
        brightness: _brightness,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('路由'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (_brightness == Brightness.dark) {
                        _brightness = Brightness.light;
                      } else {
                        _brightness = Brightness.dark;
                      }
                    });
                  },
                  child: Text('切换'),
                ),
                RouteNavigator()
              ],
            ),
          )),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroupPage(),
        'full': (BuildContext context) => StateFullGroupPage(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'plugin': (BuildContext context) => PluginUse(),
        'gesture': (BuildContext context) => GesturePage(),
        'resource': (BuildContext context) => ResPage(),
        'launch': (BuildContext context) => LaunchPage(),
        'life': (BuildContext context) => WidgetLifecycle(),
        'app_life': (BuildContext context) => AppLifecycle(),
        'photo_app': (BuildContext context) => PhotoApp(),
        'image': (BuildContext context) => ImagePage(),
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
      child: Wrap(runSpacing: 10, spacing: 7, children: [
        SwitchListTile(
          title: Text('${byName ? "" : '不'}通过路由名跳转'),
          value: byName,
          onChanged: (value) {
            setState(() {
              byName = value;
            });
          },
        ),
        _item('statelessWidget与基础组件', LessGroupPage(), 'less'),
        _item('statefullWidget与基础组件', StateFullGroupPage(), 'full'),
        _item('flutter布局', FlutterLayoutPage(), 'layout'),
        _item('插件', PluginUse(), 'plugin'),
        _item('手势', GesturePage(), 'gesture'),
        _item('资源文件', ResPage(), 'resource'),
        _item('打开第三方应用', LaunchPage(), 'launch'),
        _item('页面生命周期', WidgetLifecycle(), 'life'),
        _item('APP应用生命周期', AppLifecycle(), 'app_life'),
        _item('【实战】拍照APP开发', PhotoApp(), 'photo_app'),
        _item('图片设置', ImagePage(), 'image'),
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
