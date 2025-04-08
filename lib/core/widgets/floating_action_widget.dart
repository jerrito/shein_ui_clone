import 'package:flutter/material.dart';
import 'package:shein_ui_clone/features/trends/presentation/widgets/trend_icon.dart';

class FloatingActionWidget extends StatelessWidget {
  const FloatingActionWidget({
    super.key,
    this.text = "Trends",
    this.onTap,
    required this.isActive,
  });
  final String text;
  final VoidCallback? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: FloatingActionButton(
        splashColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        onPressed: onTap,
        child: TrendingWidget(
          text: text,
          size: 100,
          color: Colors.purple.withValues(
            alpha: isActive ? 1 : 0.2,
          ),
        ),
      ),
    );
  }
}
