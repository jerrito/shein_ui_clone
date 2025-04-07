import 'package:flutter/material.dart';

class ProductCategoryWidget extends StatelessWidget {
  const ProductCategoryWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
  final String title, subtitle, imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(
                imagePath,
              ))),
          child: const Placeholder(), // Replace with ClipOval and actual image
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        if (subtitle.isNotEmpty)
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
