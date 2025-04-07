import 'package:flutter/material.dart';
import 'dart:math';

class TrendingWidget extends StatelessWidget {
  final double size; // Size of the pentagon
  final Color color; // Color of the pentagon
  final String text;

  const TrendingWidget({
    super.key,
    required this.size,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
            size: Size(size, size), // Size of the widget
            painter: PentagonPainter(color)),
        Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 10,
            fontStyle: FontStyle.italic,
          ),
        )),
      ],
    );
  }
}

class PentagonPainter extends CustomPainter {
  final Color color; // Color of the pentagon

  PentagonPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Create a path for the pentagon
    Path path = Path();

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = size.width / 2;

    // Angle for each of the pentagon's corners (360° divided by 5)
    double angle = 2 * pi / 5;

    // Start drawing the pentagon
    for (int i = 0; i < 5; i++) {
      double x = centerX +
          radius *
              cos(i * angle - pi / 2); // Subtract pi/2 for correct rotation
      double y = centerY + radius * sin(i * angle - pi / 2);

      if (i == 0) {
        path.moveTo(x, y); // Move to the first point
      } else {
        path.lineTo(x, y); // Draw lines to the next points
      }
    }

    path.close(); // Close the path to complete the pentagon

    // Draw the pentagon on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint
  }
}
