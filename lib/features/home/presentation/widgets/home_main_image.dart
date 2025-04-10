import 'package:flutter/material.dart';
import 'package:shein_ui_clone/assets/images/images.dart';

enum HomeMainImages {
  activewear(
    imagePath: Images.styleImage,
    color: Colors.blue,
  ),
  christmasWear(
    imagePath: Images.extraImage,
    color: Colors.red,
  ),
  luxuryWear(
    imagePath: Images.hottestImage,
    color: Colors.green,
  ),
  trendyWear(
    imagePath: Images.trendyImage,
    color: Colors.green,
  );

  final String imagePath;
  final Color? color;
  const HomeMainImages({
    required this.imagePath,
    required this.color,
  });
}
