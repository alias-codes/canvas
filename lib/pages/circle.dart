import 'package:flutter/material.dart';

class Circle extends StatefulWidget {
  const Circle({super.key});

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  final List<Offset?> points = [];

  Offset? findCenter(List<Offset?> points) {
    int n = 0;
    double x = 0, y = 0;
    for (int i = 0; i < points.length; i++) {
      if (points[i] != null) {
        n++;
        x += points[i]!.dx;
        y += points[i]!.dy;
      }
    }

    double centerX = x / n;
    double centerY = y / n;

    if (n == 0) return null;
    return Offset(centerX, centerY);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draw Anything'),
        backgroundColor: const Color.fromRGBO(180, 147, 255, 1.0),
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
                behavior: HitTestBehavior.opaque,
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
            ElevatedButton(
              onPressed: () {},
              child: Text('Analyze', style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final List<Offset?> points;

  CirclePainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i <= points.length - 2; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CirclePainter oldDelegate) => true;
}
