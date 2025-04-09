import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shein_ui_clone/core/media_query_size.dart';
import 'package:shein_ui_clone/features/trends/presentation/widgets/bottom_stack_image.dart';
import 'package:shein_ui_clone/features/trends/presentation/widgets/custom_design_image.dart';
import 'package:shein_ui_clone/features/trends/presentation/widgets/trend_right_stack_data.dart';
import 'package:shein_ui_clone/features/trends/presentation/widgets/trend_top_section.dart';

class TrendImageWidget extends StatelessWidget {
  const TrendImageWidget({
    super.key,
    required this.color,
    required this.image,
    required this.risingPercentage,
    required this.hashTag,
    required this.daysLeft,
  });
  final Color color;
  final String image, risingPercentage, hashTag, daysLeft;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.height(context, 0.55),
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: Sizes.height(context, 0.55),
              child: ColoredBox(color: color)),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: TrendTopSection(),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ImageHolder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: CachedNetworkImageProvider(image),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TrendRightStackData(
                risingPercentage: risingPercentage,
                hashTag: hashTag,
                daysLeft: daysLeft,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: List.generate(
                3,
                (int x) => BottomStackImage(
                  imagePath:
                      "https://images-cdn.ubuy.co.in/65dd65c6862c8d1233658cdd-formal-suits-for-men-wedding-slim-fit-3.jpg",
                  amount: 33.22,
                  data: "#Lace Accessor",
                ),
              ),
            ),
          )
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
      margin: EdgeInsets.only(
        right: Sizes.width(context, 0.05),
      ),
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
