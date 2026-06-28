import 'dart:ui';

import 'package:flutter/material.dart';


class Circle extends StatefulWidget {
  const Circle({super.key});

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GestureDetector(
            onDoubleTap: () {
              debugPrint('Double Tapped for testing');
            },
            child: CustomPaint(
              painter: CirclePainter(),
            ),
          ),
        ),
      ),
    );
  }
}


class CirclePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 20;

    // size variable is the size of the canvas
    final x = size.width/2;
    final y = size.height/2;
    final center = Offset(x, y);

    debugPrint('$x, $y');

    canvas.drawCircle(center, 50, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}