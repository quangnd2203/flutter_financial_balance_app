// ignore_for_file: use_key_in_widget_constructors, flutter_style_todos, depend_on_referenced_packages
import 'dart:math';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../constants/app_images.dart';
import '../ui.dart';
import '../widgets/ball/widget_ball.dart';
import '../widgets/inner_shadow.dart';

class SplashScreen extends BaseScreen<SplashController> {
  @override
  Widget? builder() {
    // TODO: implement builder
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimationWidget(),
      ),
    );
  }
}

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({Key? key}) : super(key: key);

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;

  Offset offset = Offset.zero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    animation = Tween<double>(begin: pi, end: -pi).animate(animationController);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    const Size size = Size(250, 250);
    return Listener(
      onPointerMove: (PointerMoveEvent e){
        // setState(() {
        //   // - 50 to center the container
        //   offset = e.localPosition + Offset(50, 50);
        // });
        // print(e.localPosition);
      },
      onPointerDown: (PointerDownEvent e){
        // print(e.position);
      },
      child: WidgetBall(
        diameter: size.shortestSide,
        lightSource: const Offset(0.5, -0.5),
        child: Transform(
          // origin: size.center(Offset(0, -125)),
          alignment: Alignment(0, -0.7),
          transform: Matrix4.identity()..scale(0.5)..rotate(vector.Vector3(1,0,0), 70),
          child: const DCurved(
            lightSource: Offset(0.5, -0.5),
          ),
        ),
      ),
    );
  }
}
