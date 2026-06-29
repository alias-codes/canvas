import 'dart:ui';

import 'package:flutter/material.dart';

class Circle extends StatefulWidget {
  const Circle({super.key});

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {

  final List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draw Anything', ),
        backgroundColor: Color.fromRGBO(105, 223, 209, 0.657),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            points.clear();
          });
        },
        child: const Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,


      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: GestureDetector(

                onPanStart: (details) {
                  setState(() {
                    points.add(details.localPosition);
                  });
                },

                onPanUpdate: (details) {
                  setState(() {
                    points.add(details.localPosition);
                  });
                },

                onPanEnd: (details) {
                  setState(() {
                    points.add(null);
                  });
                },
                child: CustomPaint(
                  painter: CirclePainter(points: points),
                  child: Container(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*------------------------------------------------------------------------------*/

class CirclePainter extends CustomPainter{

  final List<Offset?> points;

  CirclePainter({required this.points});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10;
    paint.strokeCap = StrokeCap.round;

    // size variable is the size of the canvas

    // canvas.drawLine();
    for (int i =0; i <= points.length -2; i++) {
      if(points[i] == null || points[i+1] == null){
        continue;
      }
      canvas.drawLine(
        points[i]!,
        points[i+1]!,
        paint
      );

    }
  }

  @override
  bool shouldRepaint(covariant CirclePainter oldDelegate) {
    return true;
  }

}