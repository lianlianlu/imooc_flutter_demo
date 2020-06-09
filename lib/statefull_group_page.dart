import 'package:flutter/material.dart';

class StateFullGroupPage extends StatefulWidget {
  @override
  _StateFullGroupPageState createState() => _StateFullGroupPageState();
}

class _StateFullGroupPageState extends State<StateFullGroupPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: '如何使用插件和包',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('statefullWidget与基础组件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                title: Text('首页')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                title: Text('内容'))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Image.network(
                        'http://www.devio.org/img/avatar.png',
                        width: 100,
                        height: 100,
                      ),
                      TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              hintText: '请输入',
                              hintStyle: TextStyle(fontSize: 15))),
                      Container(
                        height: 100,
                        margin: EdgeInsets.all(10),
                        decoration:
                            BoxDecoration(color: Colors.lightBlueAccent),
                        child: PageView(
                          children: <Widget>[
                            _item('page1', Colors.deepPurple),
                            _item('page2', Colors.red),
                            _item('page3', Colors.yellow)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                onRefresh: _handleRefresh,
              )
            : Text('列表'),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    return null;
  }

  _item(String title, Color color) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: color),
        child: Text(
          title,
          style: TextStyle(fontSize: 22, color: Colors.white),
        ));
  }
}
