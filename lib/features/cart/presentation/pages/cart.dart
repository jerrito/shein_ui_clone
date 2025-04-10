import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shein_ui_clone/assets/svgs.dart';
import 'package:shein_ui_clone/core/widgets/buttons/default_button.dart';

class Cart extends StatefulWidget {
  const Cart({super.key, this.categoryOnTap});
  final VoidCallback? categoryOnTap;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white, // White background for the body
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(width: 8), // Small space
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 2,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200], // Light grey background
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize:
                    MainAxisSize.min, // Row takes minimum space needed
                children: [
                  const Icon(Icons.location_on_outlined,
                      size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    "Ship to Ghana", // Replace with dynamic location if needed
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border), // Heart icon for wishlist
            onPressed: () {
              // Handle wishlist action
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              child: Column(
                // crossAxisAlignment: C,
                children: [
                  const SizedBox(height: 20.0),

                  // Text Lines
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Svgs.cartSVG,
                        width: 60.0,
                        height: 60.0,
                        color: Colors.grey[600],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Your cart is empty",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 2.0),
                          Text(
                            "Every item for every need",
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.grey[600]),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),

                  DefaultButton(
                    isProfile: true,
                    onPressed: widget.categoryOnTap,
                    text: "Shop by Category",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
