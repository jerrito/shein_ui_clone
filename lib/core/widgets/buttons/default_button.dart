import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.onPressed,
    required this.text,
    this.isProfile = false,
  });
  final VoidCallback? onPressed;
  final String text;
  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    return // Button
        ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // Black background
        foregroundColor: Colors.white, // White text
        padding: EdgeInsets.symmetric(
            horizontal: isProfile ? 10 : 40.0, vertical: isProfile ? 0 : 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            isProfile ? 0 : 8.0,
          ), // Slightly rounded corners
        ),
        textStyle: TextStyle(
          fontSize: isProfile ? 14 : 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(
        text,
      ),
    );
  }
}
