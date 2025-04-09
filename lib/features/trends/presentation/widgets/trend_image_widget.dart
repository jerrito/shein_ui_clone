import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shein_ui_clone/core/media_query_size.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/header_section.dart';
import 'package:shein_ui_clone/features/trends/presentation/widgets/trend_search_widget.dart';

class TrendImageWidget extends StatelessWidget {
  const TrendImageWidget({
    super.key,
    required this.color,
    required this.image,
  });
  final Color color;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.height(context, 0.5),
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: Sizes.height(context, 0.5),
              child: ColoredBox(color: color)),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: TrendTopSection(),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.centerRight,
              child: ImageContainer(
                image: image,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TrendTopSection extends StatelessWidget {
  const TrendTopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Trends Store",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: Sizes.width(context, 0.45),
                child: TrendSearchWidget(
                    // Background color for the header
                    ),
              ),
              SizedBox(width: Sizes.width(context, 0.02)),
              Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.height(context, 0.1),
      width: Sizes.width(context, 0.4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
