import 'package:flutter/material.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/text_field_hint.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.color,
    required this.isCategory,
  });
  final Color color;
  final bool isCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(Icons.mail_outline,
              color: isCategory ? Colors.black : Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: isCategory
                    ? Colors.grey[200]
                    : Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  Icon(Icons.search,
                      color: isCategory ? Colors.black : Colors.white70),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 30,
                    // width: 200,
                    child: VerticalTextCarousel(
                      texts: [
                        "Shoes",
                        "Bags",
                        "Phones",
                        "Accessories",
                        "Clothes",
                        "Electronics",
                        "Beauty",
                      ],
                      isCategory: isCategory,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.camera_alt_outlined,
                      color: isCategory ? Colors.black : Colors.white70),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Icon(Icons.favorite_border,
              color: isCategory ? Colors.black : Colors.white),
        ],
      ),
    );
  }
}
