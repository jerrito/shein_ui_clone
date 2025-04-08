import 'package:flutter/material.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/text_field_hint.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.mail_outline, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  const Icon(Icons.search, color: Colors.white70),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 30,
                    // width: 200,
                    child: VerticalTextCarousel(texts: [
                      "Shoes",
                      "Bags",
                      "Phones",
                      "Accessories",
                      "Clothes",
                      "Electronics",
                      "Beauty",
                    ]),
                  ),
                  const Spacer(),
                  const Icon(Icons.camera_alt_outlined, color: Colors.white70),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.favorite_border, color: Colors.white),
        ],
      ),
    );
  }
}
