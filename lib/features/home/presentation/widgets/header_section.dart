import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shein_ui_clone/assets/svgs.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/text_field_hint.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.color,
    required this.isCategory,
    this.iconColor,
  });
  final Color color;
  final Color? iconColor;
  final bool isCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Icon(Icons.mail_outline,
              color: iconColor ?? (isCategory ? Colors.black : Colors.white)),
          const SizedBox(width: 12),
          if (!isCategory)
            Badge(
              backgroundColor: Colors.red,
              child: SvgPicture.asset(Svgs.archiveSVG,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    iconColor ?? (isCategory ? Colors.black : Colors.white),
                    BlendMode.srcIn,
                  )),
            ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                border:
                    iconColor != null ? Border.all(color: iconColor!) : null,
                color: isCategory ? Colors.grey[200] : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 8),

                  // const SizedBox(width: 8),
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
                  Icon(
                    Icons.camera_alt_outlined,
                    color: iconColor ??
                        (isCategory ? Colors.black : Colors.black26),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: isCategory ? 10 : 2,
                      horizontal: isCategory ? 12 : 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(isCategory ? 2 : 12),
                      color: iconColor ?? (isCategory ? Colors.black : color),
                    ),
                    child: Transform.scale(
                      scale: 0.9,
                      child: SvgPicture.asset(Svgs.searchSVG,
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          )),
                    ),
                  ),
                  SizedBox(width: isCategory ? 0 : 4),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Icon(
            Icons.favorite_border,
            color: iconColor ?? (isCategory ? Colors.black : Colors.white),
          ),
        ],
      ),
    );
  }
}
