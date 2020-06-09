import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

///动画分离  AnimatedBuilder
///1 显示logo
///2 定义Animation对象
///3 渲染过渡效果

class AnimationLogo2 extends StatefulWidget {
  @override
  _AnimationLogo2State createState() => _AnimationLogo2State();
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
          width: animation.value,
          height: animation.value,
          child: child,
        ),
        child: child,
      ),
    );
  }
}

class _AnimationLogo2State extends State<AnimationLogo2>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(child: LogoWidget(), animation: animation);
  }
}
