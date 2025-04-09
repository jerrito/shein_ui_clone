import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shein_ui_clone/core/media_query_size.dart';

class ImageHolder extends StatelessWidget {
  final ImageProvider image;
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const ImageHolder({
    super.key,
    required this.image,
    this.width = 100.0,
    this.height = 100.0,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.height(context, 0.1),
      width: Sizes.width(context, 0.4),
      child: CustomPaint(
        painter: _ImagePainter(
          image: image,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

class _ImagePainter extends CustomPainter {
  final ImageProvider image;
  final BorderRadius? borderRadius;
  ImageStream? _imageStream;
  ImageInfo? _imageInfo;

  _ImagePainter({required this.image, this.borderRadius});

  // @override
  // void dispose() {
  //   _imageStream?.removeAllListeners();
  //   super.dispose();
  // }
  void _loadAndPaintImage(Canvas canvas, Size size) async {
    final ImageStreamListener listener =
        ImageStreamListener((ImageInfo info, bool synchronousCall) {
      _imageInfo = info;
      paint(canvas, size);
    });
    _imageStream?.addListener(listener);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (_imageInfo != null) {
      final paint = Paint();
      final image = _imageInfo!.image;
      final src =
          Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble());
      final dst = Rect.fromLTWH(0, 0, size.width, size.height);

      if (borderRadius != null) {
        final rrect = RRect.fromRectAndCorners(
          dst,
          topLeft: borderRadius?.topLeft ?? Radius.zero,
          topRight: borderRadius?.topRight ?? Radius.zero,
          bottomLeft: borderRadius?.bottomLeft ?? Radius.zero,
          bottomRight: borderRadius?.bottomRight ?? Radius.zero,
        );
        canvas.drawRRect(rrect, paint);
        canvas.drawImageRect(image, src, dst,
            paint); // You might need to adjust this for proper clipping
      } else {
        canvas.drawImageRect(image, src, dst, paint);
      }
    } else {
      // Optionally draw a placeholder or loading indicator
      final paint = Paint()..color = Colors.grey[300]!;
      canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(_ImagePainter oldDelegate) {
    return oldDelegate.image != image ||
        oldDelegate.borderRadius != borderRadius;
  }

  void didChangeSemantics() {
    if (_imageStream == null) {
      _imageStream = image.resolve(ImageConfiguration.empty);
      _loadAndPaintImage(
          Canvas(PictureRecorder()), Size.zero); // Trigger initial load
    }
  }
}
