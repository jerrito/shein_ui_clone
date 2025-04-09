import 'package:flutter/material.dart';

class UpcomingDate extends StatelessWidget {
  const UpcomingDate({
    super.key,
    required this.daysLeft,
  });
  final String daysLeft;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      child: Row(
        children: [
          Container(
            width: 35,
            height: 20,
            padding: EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Text(
              "New",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 20,
            width: 75,
            padding: EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Text(
              daysLeft,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
    );
  }
}
