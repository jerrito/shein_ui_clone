import 'package:flutter/material.dart';
import 'package:shein_ui_clone/assets/images/images.dart';

enum HomeMainImages {
  activewear(
    imagePath: Images.styleImage,
  ),
  christmasWear(
    imagePath: Images.extraImage,
  ),
  luxuryWear(
    imagePath: Images.hottestImage,
  ),
  trendyWear(
    imagePath: Images.trendyImage,
  );

  final String imagePath;

  const HomeMainImages({
    required this.imagePath,
  });
}
