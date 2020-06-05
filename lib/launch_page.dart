import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('打开第三方应用'),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: _launchURL,
                child: Text('Show Flutter homepage'),
              ),
              RaisedButton(
                onPressed: _openMap,
                child: Text('打开地图'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.baidu.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '不能打开链接 $url';
    }
  }

  //打开地图
  _openMap() async {
    // Android 必须知道APP的schema
    const url = 'geo:52.32.4,4.917';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      //IOS
      const url = "http://maps.apple.com/?ll=52.32,4.917";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw '不能打开链接 $url';
      }
    }
  }
}
