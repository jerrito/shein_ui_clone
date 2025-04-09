import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A customizable widget that renders a sperm-like design.
///
/// The sperm has its head pointing northeast and a zigzag tail.
/// The head size is set to approximately 4 pixels in diameter.
class RisingArt extends StatelessWidget {
  /// Width of the widget
  final double width;

  /// Height of the widget
  final double height;

  /// Background color of the container
  final Color backgroundColor;

  /// Color of the sperm head
  final Color headColor;

  /// Color of the sperm head outline
  final Color headOutlineColor;

  /// Color of the sperm tail
  final Color tailColor;

  /// Width of the tail stroke
  final double tailThickness;

  /// How zigzaggy the tail should be (higher = more zigzags)
  final double zigzagFrequency;

  /// How wide the zigzags should be
  final double zigzagAmplitude;

  /// Exact head size in pixels (approximately)
  final double headSize;

  const RisingArt({
    super.key,
    this.width = 75,
    this.height = 30,
    this.backgroundColor = Colors.transparent,
    this.headColor = Colors.white,
    this.headOutlineColor = Colors.white,
    this.tailColor = Colors.white,
    this.headSize = 10.0,
    this.tailThickness = 3.0,
    this.zigzagFrequency = 0.2,
    this.zigzagAmplitude = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(
        bottom: 25,
        left: 15,
      ),
      color: backgroundColor,
      child: CustomPaint(
        painter: _SpermPainter(
          headColor: headColor,
          headOutlineColor: headOutlineColor,
          tailColor: tailColor,
          headSize: headSize,
          tailThickness: tailThickness,
          zigzagFrequency: zigzagFrequency,
          zigzagAmplitude: zigzagAmplitude,
        ),
        size: Size(width, height),
      ),
    );
  }
}

class _SpermPainter extends CustomPainter {
  final Color headColor;
  final Color headOutlineColor;
  final Color tailColor;
  final double headSize;
  final double tailThickness;
  final double zigzagFrequency;
  final double zigzagAmplitude;

  _SpermPainter({
    required this.headColor,
    required this.headOutlineColor,
    required this.tailColor,
    required this.headSize,
    required this.tailThickness,
    required this.zigzagFrequency,
    required this.zigzagAmplitude,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Define paint styles
    final headPaint = Paint()
      ..color = headColor
      ..style = PaintingStyle.fill;

    final headOutlinePaint = Paint()
      ..color = headOutlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0; // Reduced stroke width for tiny head

    final tailPaint = Paint()
      ..color = tailColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = tailThickness
      ..strokeCap = StrokeCap.round;

    // Calculate positions - fixed head size at approximately 4 pixels
    final centerX = size.width * 0.6;
    final centerY = size.height * 0.4;
    final headCenter = Offset(centerX, centerY); // Northeast positioning
    final headRadius = headSize / 2;

    // Draw the head
    canvas.drawCircle(headCenter, headRadius, headPaint);
    canvas.drawCircle(headCenter, headRadius, headOutlinePaint);

    // Calculate the tail start point (southwest of the head)
    final tailStart = Offset(
      headCenter.dx - headRadius * math.sin(math.pi / 4),
      headCenter.dy + headRadius * math.cos(math.pi / 4),
    );

    // Draw the tail with zigzag pattern
    final path = Path();
    path.moveTo(tailStart.dx, tailStart.dy);

    // Create zigzag pattern
    double currentAmplitude =
        zigzagAmplitude * (size.width / 300); // Scale amplitude based on size
    int segments = 12;
    double tailLength = size.width * 0.7;

    for (int i = 0; i <= segments; i++) {
      double t = i / segments;
      double x = tailStart.dx - t * tailLength;
      double y = tailStart.dy + t * tailLength * 0.5;

      // Add zigzag pattern
      if (i > 0) {
        double offset =
            currentAmplitude * math.sin(zigzagFrequency * i * math.pi);

        // Decrease amplitude as we go further to make it look more natural
        currentAmplitude = currentAmplitude * 0.92;

        path.lineTo(x, y + offset);
      }
    }

    // Draw the tail
    canvas.drawPath(path, tailPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
