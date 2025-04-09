import 'package:flutter/material.dart';
import 'dart:math' as math;

// The main logo widget
class DLogoWidget extends StatelessWidget {
  final double size;
  final Color arrowColor; // Color for the inner downward curve
  final Color curveColor; // Color for the outer D curve
  final double strokeWidth; // Combined stroke width
  final double gap; // Horizontal gap between the two parts

  const DLogoWidget({
    super.key,
    required this.size,
    this.arrowColor = const Color.fromARGB(255, 243, 84, 35),
    this.curveColor = Colors.black,
    this.strokeWidth = 15.0,
    this.gap = -6.0, // Default gap if not provided
  });

  @override
  Widget build(BuildContext context) {
    // Ensure stroke width isn't larger than reasonable
    final effectiveStrokeWidth = math.min(strokeWidth, size / 3);
    // Define the width allocated for the arrow painter's area
    // Adjust this factor if the arrow curve needs more/less space
    final double arrowAreaWidth = size * 0.25;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.centerLeft, // Align children to the left center
        children: [
          // 1. Custom Painted Downward Curve (Left part)
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width:
                arrowAreaWidth, // Allocate specific width for the arrow painter
            child: CustomPaint(
              painter: CurvedDownArrowPainter(
                color: arrowColor,
                strokeWidth: effectiveStrokeWidth,
              ),
            ),
          ),

          // 2. Curved Part of 'D' (Right part) - Start after the gap
          Positioned(
            // Start this painter after the arrow area AND the gap
            left: arrowAreaWidth + gap,
            top: 0,
            right: 0, // Extend curve to the right edge
            bottom: 0,
            child: CustomPaint(
              painter: DCurvePainter(
                color: curveColor,
                strokeWidth: effectiveStrokeWidth,
              ),
              // Size is now the total width minus the arrow area and the gap
              size: Size(size - arrowAreaWidth - gap, size),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Painter for the downward curving line (replaces vertical stem)
// Adjusted path points slightly to prevent painting outside its bounds
class CurvedDownArrowPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  CurvedDownArrowPainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final Path path = Path();

    // Adjust start/end points slightly further from edges to account for stroke
    final double inset =
        strokeWidth * 0.6; // Use slightly more than half stroke
    final double startX =
        size.width - inset; // Start near top-right (within bounds)
    final double startY = inset;
    final double endX =
        size.width - inset; // End near bottom-right (within bounds)
    final double endY = size.height - inset;

    // Control point - adjust if needed based on new width
    final double controlX = size.width * 0.1; // Pull left
    final double controlY = size.height / 2;

    path.moveTo(startX, startY);
    path.quadraticBezierTo(controlX, controlY, endX, endY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CurvedDownArrowPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
  }
}

// Custom Painter for the 'D' curve (Outer curve - no changes needed here)
class DCurvePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  DCurvePainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final Path path = Path();
    final rect = Rect.fromLTWH(-size.width * 0.2, strokeWidth / 2,
        size.width * 1.2, size.height - strokeWidth);

    const double startAngle = -math.pi / 2;
    const double sweepAngle = math.pi;
    path.arcTo(rect, startAngle, sweepAngle, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant DCurvePainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
  }
}
