import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shein_ui_clone/assets/images/images.dart';
import 'package:shein_ui_clone/core/media_query_size.dart';

class ProductCategoryWidget extends StatelessWidget {
  const ProductCategoryWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.isCategory = false,
  });
  final String title, subtitle, imagePath;
  final bool isCategory;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Sizes.height(context, 0.085),
          width: Sizes.width(
            context,
            isCategory ? 0.170 : 0.140,
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 224, 217, 217),
              image: DecorationImage(
                  image: imagePath == ''
                      ? AssetImage(Images.foodImage)
                      : CachedNetworkImageProvider(
                          imagePath,
                        ))),
          // child: const Placeholder(), // Replace with ClipOval and actual image
        ),
        // const SizedBox(height: 6),
        SizedBox(
          width: Sizes.width(
            context,
            isCategory ? 0.170 : 0.165,
          ),
          child: Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: title.length >= 10 ? 11 : 12,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
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
