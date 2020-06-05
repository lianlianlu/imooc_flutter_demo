import 'package:flutter/material.dart';

//生命周期
///1. 初始化周期
///createState initState
///2. 更新时期
///didChangeDependencies  build  didUpdateWidget
///3. 销毁期
///deactivate  dispose
class WidgetLifecycle extends StatefulWidget {
  ///当我们构建一个新的StatefulWidget时，这个时候会立即调用createState()
  ///并且这个方法是必须被覆盖
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;
  @override
  void initState() {
    print('-------initState----------做一些初始化工作');
    super.initState();
  }

  ///所依赖的state的对象改变的时候调用:
  ///a. 在第一次构建widgt时，在initState()之后立即调用此方法
  ///b. 如果StatefulWidget依赖于InheritedWidget, 那么当当前的State所依赖InheritedWidget
  @override
  void didChangeDependencies() {
    print('-------didChangeDependencies----------');
    super.didChangeDependencies();
  }

  ///在didChangeDependencies()之后理解调用
  ///另外当调用setState后也会再次调用该方法
  @override
  Widget build(BuildContext context) {
    print('--------build--------');
    return Scaffold(
      appBar: AppBar(
        title: Text('生命周期'),
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: Text(
                '点我',
                style: TextStyle(fontSize: 26),
              ),
            ),
            Text(_count.toString())
          ],
        ),
      ),
    );
  }

  ///这个一个不常用到的生命周期方法，当父组件需要重新绘制的时候才会调用：
  ///该方法会携带一个oldWidget参数，可以将其与当前的widget进行对比以便执行一些额外的逻辑，如
  ///if (oldWidget.title != widget.title){}
  @override
  void didUpdateWidget(WidgetLifecycle oldWidget) {
    print('------didUpdateWidget-----');
    super.didUpdateWidget(oldWidget);
  }

  ///很少使用，在组件被移除时调用， 在dispose之前调用。
  ///
  @override
  void deactivate() {
    print('-------deactivate -------');
    super.deactivate();
  }

  ///常用  在组件被销毁时调用
  ///通常在该方法中执行一些资源的释放工作， 比如： 监听器的卸载，channel的销毁等
  @override
  void dispose() {
    print('-------dispose -------');
    super.dispose();
  }
}
