import 'package:flutter/material.dart';
import 'package:shein_ui_clone/features/profile/presentation/widgets/icon_text_item.dart';

class ServiceRowWidget extends StatelessWidget {
  const ServiceRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child: IconTextItem(
                icon: Icons.headset_mic_outlined, label: "Customer Service")),
        Expanded(
            child: IconTextItem(
                icon: Icons.calendar_today_outlined,
                label: "Check In")), // Placeholder icon
        Expanded(
            child: IconTextItem(
                icon: Icons.poll_outlined,
                label: "Survey Center")), // Placeholder icon
        Expanded(
            child: IconTextItem(
                icon: Icons.favorite_border_outlined,
                label: "Gals")), // Placeholder icon
        Expanded(
            child: IconTextItem(
                icon: Icons.share_outlined, label: "Share & Earn")),
      ],
    );
  }
}
