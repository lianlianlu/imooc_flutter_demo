import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimatedWidgetLogoApp extends StatefulWidget {
  @override
  _AnimatedWidgetLogoAppState createState() => _AnimatedWidgetLogoAppState();
}

class AnimationLogo extends AnimatedWidget {
  AnimationLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class _AnimatedWidgetLogoAppState extends State<AnimatedWidgetLogoApp>
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
    //controller.forward();
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLogo(animation: animation);
  }
}
