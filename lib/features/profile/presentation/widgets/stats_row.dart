import 'package:flutter/material.dart';
import 'package:shein_ui_clone/features/profile/presentation/widgets/stat_item.dart';

class StatsRowWidget extends StatelessWidget {
  const StatsRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StatItemWidget(
              icon: Icons.confirmation_number_outlined,
              value: "3",
              label: "Coupons"),
          StatItemWidget(
              icon: Icons.monetization_on_outlined,
              value: "0",
              label: "Points"),
          StatItemWidget(
              icon: Icons.account_balance_wallet_outlined,
              value: null,
              label: "Wallet"),
          StatItemWidget(
              icon: Icons.card_giftcard_outlined,
              value: null,
              label: "Gift Card"),
        ],
      ),
    );
  }
}
