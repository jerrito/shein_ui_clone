import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shein_ui_clone/assets/images/images.dart';
import 'package:shein_ui_clone/core/enums/super_deals.dart';

class SuperDealsSection extends StatelessWidget {
  const SuperDealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text(
                      'Super',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.flash_on, color: Colors.orange),
                    Text(
                      'Deals',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'View more',
                      style: TextStyle(fontSize: 14),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                // scrollDirection: Axis.horizontal,
                // padding: const EdgeInsets.symmetric(horizontal: 8),
                children: SuperDealsEnum.values
                    .map((e) => _buildDealCard(
                          e.discount ?? '',
                          e.url,
                          e.amount,
                        ))
                    .toList()

                // _buildDealCard('-53%', 'assets/deal1.png'),
                // _buildDealCard('-20%', 'assets/deal2.png'),
                // _buildDealCard('-35%', 'assets/deal3.png'),
                // _buildDealCard('-15%', 'assets/deal4.png'),
                // ],
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildDealCard(String discount, String imagePath, amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 90,
          height: 90,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Stack(
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    border: discount.isNotEmpty
                        ? Border.all(
                            color: Colors.amber,
                            width: 4,
                          )
                        : null,
                    color: Colors.red[50],
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: imagePath == ''
                            ? AssetImage(Images.foodImage)
                            : CachedNetworkImageProvider(
                                imagePath,
                              ))),
                // child: const Placeholder(), // Replace with ClipOval and actual image
              ),
              if (discount.isNotEmpty)
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.flash_on,
                          color: Colors.black,
                          size: 12,
                        ),
                        Text(
                          discount,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: RichText(
            text: TextSpan(
                text: "\$",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
                children: [
                  TextSpan(
                    text: '$amount',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
