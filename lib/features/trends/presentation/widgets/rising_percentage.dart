import 'package:flutter/material.dart';

class RisingPercentage extends StatelessWidget {
  const RisingPercentage({super.key, required this.risingPercentage});
  final String? risingPercentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      child: Center(
        child: Text(
          risingPercentage != null ? 'Rising $risingPercentage%' : 'Break...',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
