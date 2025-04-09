import 'dart:math';
import 'package:flutter/material.dart';

class TrendingWidget extends StatelessWidget {
  final double size;
  final Color color, textColor;
  final String text;

  const TrendingWidget({
    super.key,
    required this.size,
    required this.color,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(size, size),
          painter: HexagonPainter(color),
        ),
        Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}

class HexagonPainter extends CustomPainter {
  final Color color;

  HexagonPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;
    final double angle = 2 * pi / 6;
    final double cornerRadius = 5.0;

    final List<Offset> points = [];

    for (int i = 0; i < 6; i++) {
      double x = centerX + radius * cos(i * angle - pi / 2);
      double y = centerY + radius * sin(i * angle - pi / 2);
      points.add(Offset(x, y));
    }

    final Path path = Path();

    for (int i = 0; i < 6; i++) {
      final Offset current = points[i];
      final Offset next = points[(i + 1) % 6];
      final Offset prev = points[(i - 1 + 6) % 6];

      final Offset dirToPrev = (prev - current).normalize();
      final Offset dirToNext = (next - current).normalize();

      final Offset cornerStart = current + dirToPrev * cornerRadius;
      final Offset cornerEnd = current + dirToNext * cornerRadius;

      if (i == 0) {
        path.moveTo(cornerStart.dx, cornerStart.dy);
      } else {
        path.lineTo(cornerStart.dx, cornerStart.dy);
      }

      path.quadraticBezierTo(
          current.dx, current.dy, cornerEnd.dx, cornerEnd.dy);
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Extension to normalize Offsets
extension Normalize on Offset {
  Offset normalize() {
    final double length = distance;
    return length == 0 ? this : this / length;
  }
}
