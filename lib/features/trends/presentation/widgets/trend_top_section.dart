import 'package:flutter/material.dart';
import 'package:shein_ui_clone/core/media_query_size.dart';
import 'package:shein_ui_clone/features/trends/presentation/widgets/trend_search_widget.dart';

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
