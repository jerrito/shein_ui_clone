import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shein_ui_clone/core/media_query_size.dart';
import 'package:shein_ui_clone/core/widgets/amount_widget.dart';

class BottomStackImage extends StatelessWidget {
  const BottomStackImage({
    super.key,
    required this.imagePath,
    required this.amount,
    required this.data,
  });
  final String imagePath, data;
  final double amount;

  @override
  Widget build(BuildContext context) {
    List<String> parts = amount.toStringAsFixed(2).split('.');
    String whole = parts[0]; // '42'
    String fraction = parts[1];
    return Container(
      width: Sizes.width(context, 0.2),
      height: Sizes.height(context, 0.11),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: Sizes.height(context, 0.08),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Container(
                      padding: EdgeInsets.symmetric(
                        // vertical: Sizes.height(context, 0.005),
                        horizontal: Sizes.width(context, 0.005),
                      ),
                      height: Sizes.height(context, 0.032),
                      width: Sizes.width(context, 0.14),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Center(
                        child: AmountWidget(
                          whole: whole,
                          fraction: fraction,
                        ),
                      )),
                ),
              )
            ],
          ),
          Container(
            height: Sizes.height(context, 0.03),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                data,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
