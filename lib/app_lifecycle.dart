import 'package:flutter/material.dart';

///如何获取Flutter应用维度生命周期
///WidgetsBindingObserver: 是一个 Widgets绑定观察器，通过它，我们可以监听应用的生命周期，语言等变化
class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    ///添加到监听器里面去
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('获取Flutter应用维度生命周期')),
      body: Container(
        child: Text('获取Flutter应用维度生命周期'),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('state=$state');
    if (state == AppLifecycleState.paused) {
      print('APP进入后台');
    } else if (state == AppLifecycleState.resumed) {
      print('APP进入前台');
    } else if (state == AppLifecycleState.inactive) {
      ///不常用： 应用程序处于非活动状态，并且未接收用户输入时调用，比如： 来了个电话
      print('APP进入非激活状态');
    } else if (state == AppLifecycleState.detached) {
      //TODO 解释
      print('detached');
    }
  }
}
