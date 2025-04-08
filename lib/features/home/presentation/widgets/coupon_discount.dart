import 'package:flutter/material.dart';

class CouponRow extends StatelessWidget {
  const CouponRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      color: Colors.pink[100],
      height: 83,
      child: Row(
        children: [
          _buildCoupon(
            'GET \$3 OFF',
            'on your first order',
            'CODE: SH3',
            Colors.pink[100]!,
            false,
          ),
          _buildCoupon(
            'SPIN TO WIN',
            '',
            'Coupons',
            Colors.pink[100]!,
            false,
          ),
          _buildCoupon(
            '15% OFF',
            'BUY \$100 GET',
            'New users only',
            Colors.pink[100]!,
            true,
          ),
        ],
      ),
    );
  }

  Widget _buildCoupon(
    String title,
    String subtitle,
    String code,
    Color color,
    bool isDiscount,
  ) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isDiscount)
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  wordSpacing: 2.0,
                  color: Colors.black45,
                ),
              ),
            Text(
              title,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                overflow: TextOverflow.ellipsis,
                fontSize: 18,
                color: const Color.fromARGB(255, 233, 138, 171),
              ),
            ),
            // const SizedBox(height: 2),
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                ),
              ),
            if (code.isNotEmpty && !isDiscount)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  code,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
