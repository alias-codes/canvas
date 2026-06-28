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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw false;
  }

}