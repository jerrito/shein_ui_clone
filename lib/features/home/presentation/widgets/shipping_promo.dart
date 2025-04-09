import 'package:flutter/material.dart';

class ShippingPromoWidget extends StatelessWidget {
  const ShippingPromoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ShippingPromotion(
            title: 'Free Shipping',
            subtitle: 'On orders of \$690.00+',
            icon: Icons.local_shipping,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ShippingPromotion(
            title: 'SALE ZONE',
            subtitle: 'Super coupons day!',
            icon: Icons.sell,
          ),
        ),
      ],
    );
  }
}

class ShippingPromotion extends StatelessWidget {
  const ShippingPromotion({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  final String title, subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber[50],
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.brown,
                  ),
                ),
                // const SizedBox(width: 8),
                Icon(
                  icon,
                  color: Colors.grey[400],
                  size: 14,
                ),
              ],
            ),
          ],
        ));
  }
}
