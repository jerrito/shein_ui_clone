import 'package:flutter/material.dart';

class AmountWidget extends StatelessWidget {
  const AmountWidget({super.key, required this.whole, required this.fraction});
  final String whole, fraction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0),
      child: RichText(
        text: TextSpan(
            text: "\$",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            children: [
              TextSpan(
                  text: whole,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  )),
              TextSpan(
                text: '.$fraction',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              )
            ]),
      ),
    );
  }
}
