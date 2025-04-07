import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background for the body
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1.0, // Subtle shadow
        // Custom title arrangement to include location
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 2), // Small space
            Row(
              mainAxisSize: MainAxisSize.min, // Row takes minimum space needed
              children: [
                const Icon(Icons.location_on_outlined,
                    size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  "Ship to Ghana", // Replace with dynamic location if needed
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
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
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Add padding around the content
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Column takes minimum vertical space
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Empty Cart Icon
              // Using a standard icon, replace with Image.asset for a custom graphic
              Icon(
                Icons.shopping_cart_outlined,
                size: 80.0,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 20.0),

              // Text Lines
              const Text(
                "Your cart is empty",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              Text(
                "Every item for every need",
                style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),

              // Button
              ElevatedButton(
                onPressed: () {
                  // Handle "Shop by Category" button press
                  // e.g., navigate to the Category screen
                  print("Shop by Category pressed");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Black background
                  foregroundColor: Colors.white, // White text
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Slightly rounded corners
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("Shop by Category"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
