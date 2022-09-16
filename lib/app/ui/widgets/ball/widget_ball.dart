// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../constants/app_images.dart';
import '../../../constants/app_text_styles.dart';
import '../inner_shadow.dart';

class WidgetBall extends StatefulWidget {
  const WidgetBall({Key? key, required this.diameter, required this.lightSource, required this.child}) : super(key: key);
  final double diameter;
  final Offset lightSource;
  final Widget child;

  @override
  _WidgetBallState createState() => _WidgetBallState();
}

class _WidgetBallState extends State<WidgetBall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.diameter,
      height: widget.diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center: Alignment(widget.lightSource.dx, widget.lightSource.dy),
          radius: 0.75,
          colors: <Color>[Colors.grey, Colors.black],
        ),
      ),
      child: widget.child,
    );
  }
}

class DCurved extends StatefulWidget {
  final Offset lightSource;
  const DCurved({Key? key, required this.lightSource}) : super(key: key);

  @override
  State<DCurved> createState() => _DCurvedState();
}

class _DCurvedState extends State<DCurved> {
  @override
  Widget build(BuildContext context) {
    final double innderShadowWidth = widget.lightSource.distance * 0.3;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          stops: <double>[1 - innderShadowWidth, 1],
          colors: <Color>[Colors.red, Colors.black],
        ),
      ),
    );
  }
}
