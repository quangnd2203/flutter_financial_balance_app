// ignore_for_file: use_key_in_widget_constructors, flutter_style_todos

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../constants/app_images.dart';
import '../ui.dart';
import '../widgets/inner_shadow.dart';

class SplashScreen extends BaseScreen<SplashController> {
  @override
  Widget? builder() {
    // TODO: implement builder
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Center(
        child: RotationWidget(
          child: PhysicalModel(
            color: Colors.transparent,
            elevation: 20,
            borderRadius: BorderRadius.circular(999),
            child: SizedBox(
              width: 300,
              height: 300,
              child: InnerShadow(
                blur: 20,
                color: Colors.blue,
                child: Image.asset(AppImages.png('earth')),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RotationWidget extends StatefulWidget {
  const RotationWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<RotationWidget> createState() => _RotationWidgetState();
}

class _RotationWidgetState extends State<RotationWidget> with TickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animationController,
      child: widget.child,
    );
  }
}
