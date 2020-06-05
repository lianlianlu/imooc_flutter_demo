import 'package:flutter/material.dart';

///flutter 布局开发
class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: '如何使用插件和包',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter布局'),
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
            ? SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          //圆形
                          ClipOval(
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.network(
                                  'http://www.devio.org/img/avatar.png'),
                            ),
                          ),
                          //裁剪 边角弧度为10
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Opacity(
                                opacity: 0.6,
                                child: Image.network(
                                    'http://www.devio.org/img/avatar.png'),
                              ),
                            ),
                          )
                        ],
                      ),
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
                        child: PhysicalModel(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(28),
                          clipBehavior: Clip.antiAlias, //抗锯齿
                          child: PageView(
                            children: [
                              _item('page1', Colors.lightBlueAccent),
                              _item('page2', Colors.red),
                              _item('page3', Colors.yellow)
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          FractionallySizedBox(
                              widthFactor: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                ),
                                child: Text('宽度盛满'),
                              ))
                        ],
                      ),
                      Stack(
                        children: [
                          Image.network(
                            'http://www.devio.org/img/avatar.png',
                            width: 100,
                            height: 100,
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Image.network(
                              'http://www.devio.org/img/avatar.png',
                              width: 36,
                              height: 36,
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 8, //水平边距
                        runSpacing: 6, //垂直边距
                        children: [
                          _chip('flutter'),
                          _chip('flutter'),
                          _chip('flutter'),
                          _chip('flutter'),
                          _chip('flutter')
                        ],
                      )
                    ],
                  ),
                ),
//                onRefresh: _handleRefresh,
              )
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Text(
                        '拉伸填满高度',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
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

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade300,
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
