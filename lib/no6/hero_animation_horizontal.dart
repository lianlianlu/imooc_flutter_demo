import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:math' as math;

class Photo extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  Photo({this.photo, this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (context, size) {
            return Image.network(
              photo,
              fit: BoxFit.contain,
            );
          },
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion({Key key, this.maxRadius, this.child})
      : clipRectSize = 2.0 * (maxRadius / math.sqrt2);
  final double maxRadius;
  final clipRectSize;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}

class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0; //最小半径
  static const double kMaxRadius = 128.0; //最大半径
  static const opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }

  static Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: kMaxRadius * 2,
                height: kMaxRadius * 2,
                child: Hero(
                  //用来描述两个动画之间过渡时的形状过渡效果  有圆形进化成方形
                  createRectTween: _createRectTween,
                  tag: imageName,
                  child: RadialExpansion(
                    maxRadius: kMaxRadius,
                    child: Photo(
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              Text(
                description,
                textScaleFactor: 3,
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 2,
      height: kMinRadius * 2,
      child: Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadialExpansion(
          maxRadius: kMaxRadius,
          child: Photo(
            photo: imageName,
            onTap: () {
              Navigator.of(context).push(PageRouteBuilder<void>(pageBuilder:
                  (BuildContext context, Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                return AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: opacityCurve.transform(animation.value),
                      child: _buildPage(context, imageName, description),
                    );
                  },
                );
              }));
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 4.0; //动画的速度
    return Scaffold(
      appBar: AppBar(
        title: const Text('高级动画'),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.all(16),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHero(
                context,
                'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1591601648&di=f0fc7528b4a1bcc7b3591415a5457af7&src=http://5b0988e595225.cdn.sohucs.com/images/20190902/f929d14c63b444138e11ca4d8f7411e9.jpeg',
                '图一'),
            _buildHero(
                context,
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591616503998&di=a8e52d02d6c374a1c89fccff5e762c9e&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F84b013314399aa9d77d89cc71de702355993abfc22858-hNnTpN_fw658',
                '图2'),
            _buildHero(
                context,
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591616503997&di=e7ee996ccad25b1dac482d9b37f0d2c2&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201710%2F29%2F20171029143158_evWuB.thumb.700_0.jpeg',
                '图3'),
          ],
        ),
      ),
    );
  }
}
