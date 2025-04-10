import 'package:flutter/material.dart';
import 'dart:math' as math;




// 1. Hexagon Image Widget
class HexagonImage extends StatelessWidget {
  final double size;
  final ImageProvider image;
  final BoxFit fit;
  final Color borderColor;
  final double borderWidth;

  const HexagonImage({
    super.key,
    required this.size,
    required this.image,
    this.fit = BoxFit.cover,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipPath(
        clipper: HexagonClipper(),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: fit,
            ),
          ),
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    double centerX = width / 2;
    double centerY = height / 2;
    double radius = min(width, height) / 2;

    // Create a hexagon
    for (int i = 0; i < 6; i++) {
      double angle = (i * 60) * math.pi / 180;
      double x = centerX + radius * math.cos(angle);
      double y = centerY + radius * math.sin(angle);
      
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Helper function
double min(double a, double b) {
  return a < b ? a : b;
}

// 2. Diamond Image Widget
class DiamondImage extends StatelessWidget {
  final double size;
  final ImageProvider image;
  final BoxFit fit;
  final Color borderColor;
  final double borderWidth;

  const DiamondImage({
    super.key,
    required this.size,
    required this.image,
    this.fit = BoxFit.cover,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Transform.rotate(
        angle: math.pi / 4, // 45 degrees
        child: ClipPath(
          clipper: RhombusClipper(),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: fit,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RhombusClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0); // Top point
    path.lineTo(size.width, size.height / 2); // Right point
    path.lineTo(size.width / 2, size.height); // Bottom point
    path.lineTo(0, size.height / 2); // Left point
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// 3. Blob Image Widget
class BlobImage extends StatelessWidget {
  final double size;
  final ImageProvider image;
  final BoxFit fit;
  final Color borderColor;
  final double borderWidth;

  const BlobImage({
    super.key,
    required this.size,
    required this.image,
    this.fit = BoxFit.cover,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipPath(
        clipper: BlobClipper(),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: fit,
            ),
          ),
        ),
      ),
    );
  }
}

class BlobClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    
    // Start from left middle
    path.moveTo(width * 0.2, height * 0.5);
    
    // Top left curve
    path.quadraticBezierTo(
      width * 0.05, height * 0.25, 
      width * 0.3, height * 0.1
    );
    
    // Top right curve
    path.quadraticBezierTo(
      width * 0.6, height * -0.05, 
      width * 0.85, height * 0.3
    );
    
    // Right middle curve
    path.quadraticBezierTo(
      width * 1.1, height * 0.5, 
      width * 0.85, height * 0.7
    );
    
    // Bottom right curve
    path.quadraticBezierTo(
      width * 0.6, height * 1.05, 
      width * 0.4, height * 0.9
    );
    
    // Bottom left curve
    path.quadraticBezierTo(
      width * 0.15, height * 0.8, 
      width * 0.2, height * 0.5
    );
    
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}