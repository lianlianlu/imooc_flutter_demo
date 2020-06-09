import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  PhotoHero({this.photo, this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo, //两个页面之间的关联，必须唯一
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; //动画的速度
    return Scaffold(
      appBar: AppBar(
        title: const Text('第一个页面'),
      ),
      body: PhotoHero(
        photo:
            'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1591601648&di=f0fc7528b4a1bcc7b3591415a5457af7&src=http://5b0988e595225.cdn.sohucs.com/images/20190902/f929d14c63b444138e11ca4d8f7411e9.jpeg',
        width: 300.0,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Scaffold(
              appBar: AppBar(title: Text('跳转的第二个页面')),
              body: Container(
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: PhotoHero(
                  photo:
                      'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1591601648&di=f0fc7528b4a1bcc7b3591415a5457af7&src=http://5b0988e595225.cdn.sohucs.com/images/20190902/f929d14c63b444138e11ca4d8f7411e9.jpeg',
                  width: 100,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            );
          }));
        },
      ),
    );
  }
}
