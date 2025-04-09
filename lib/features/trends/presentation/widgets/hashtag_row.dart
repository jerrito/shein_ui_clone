import 'package:flutter/material.dart';

class HashtagRow extends StatelessWidget {
  const HashtagRow({super.key, required this.hashTag});
  final String hashTag;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hashTag,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 15,
          child: Icon(
            Icons.arrow_outward_outlined,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
