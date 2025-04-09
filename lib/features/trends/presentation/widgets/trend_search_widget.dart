import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shein_ui_clone/assets/svgs.dart';

class TrendSearchWidget extends StatelessWidget {
  const TrendSearchWidget({
    super.key,
    this.color,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: color ?? Colors.white54,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "search",
              // Key changes, triggering animation
              style: TextStyle(
                color: Colors.black38,
                fontSize: 14,
              ),
              // textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Transform.scale(
              scale: 0.9,
              child: SvgPicture.asset(
                Svgs.searchSVG,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
