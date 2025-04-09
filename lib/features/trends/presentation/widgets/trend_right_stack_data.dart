import 'package:flutter/material.dart';
import 'package:shein_ui_clone/features/trends/presentation/widgets/hashtag_row.dart';
import 'package:shein_ui_clone/features/trends/presentation/widgets/rising_art.dart';
import 'package:shein_ui_clone/features/trends/presentation/widgets/rising_percentage.dart';
import 'package:shein_ui_clone/features/trends/presentation/widgets/upcoming_date.dart';

class TrendRightStackData extends StatelessWidget {
  const TrendRightStackData({
    super.key,
    required this.risingPercentage,
    required this.hashTag,
    required this.daysLeft,
  });
  final String risingPercentage, hashTag, daysLeft;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          RisingPercentage(
            risingPercentage: risingPercentage,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: RisingArt(
                // color: Colors.white, // Color of the drawing
                // strokeWidth: 2.0, // Line thickness

                ),
          ),
          UpcomingDate(daysLeft: daysLeft),
          HashtagRow(
            hashTag: hashTag,
          )
        ],
      ),
    );
  }
}
