import 'package:flutter/material.dart';

enum HomeMainImages {
  activewear(
      imagePath:
          'https://www.jumpusa.in/cdn/shop/articles/Activewear.jpg?v=1671261858',
      description: 'Ladies and gentlemen activewear',
      color: Colors.blue),
  christmasWear(
      imagePath:
          'https://c8.alamy.com/comp/2GM962C/photo-of-glad-couple-girl-show-v-sign-guy-take-phone-selfie-wear-ugly-pullover-isolated-red-color-background-2GM962C.jpg',
      description: 'Affordable and trendy Christmas wear',
      color: Colors.red),
  luxuryWear(
      imagePath:
          'https://c8.alamy.com/comp/2H3KRYE/photo-of-successful-rich-playboy-dress-himself-luxury-outfit-wear-striped-waistcoat-on-green-color-background-2H3KRYE.jpg',
      description: 'Luxury wear for men',
      color: Colors.green);

  final String imagePath, description;
  final Color? color;
  const HomeMainImages({
    required this.imagePath,
    required this.description,
    required this.color,
  });
}
