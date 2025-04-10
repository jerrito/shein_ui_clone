import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final List<String> tags;
  final String price;
  final String soldCount;
  final String? subTag; // e.g., "High Repeat Customers"
  final String? discount; // e.g., "-24%"

  const ProductCard({super.key, 
    required this.imageUrl,
    required this.title,
    required this.tags,
    required this.price,
    required this.soldCount,
    this.subTag,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      clipBehavior: Clip.antiAlias, // Ensures image respects the border radius
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                // Or Image.asset
                imageUrl,
                height: 130, // Adjust height as needed
                width: double.infinity,
                fit: BoxFit.cover,
                // Basic error handling for images
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 130,
                  color: Colors.grey[200],
                  child: const Center(
                      child: Icon(Icons.broken_image, color: Colors.grey)),
                ),
              ),
              // Discount Badge
              if (discount != null)
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(discount!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Tags
                Wrap(
                  // Use Wrap for tags that might span multiple lines
                  spacing: 4.0, // Horizontal space between tags
                  runSpacing: 2.0, // Vertical space between lines of tags
                  children: tags
                      .map((tag) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.pink[50], // Example tag background
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(tag,
                                style: const TextStyle(
                                    fontSize: 9, color: Colors.pink)),
                          ))
                      .toList(),
                ),
                if (subTag != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.verified_user_outlined,
                          size: 12, color: Colors.orange), // Example icon
                      const SizedBox(width: 4),
                      Text(subTag!,
                          style: const TextStyle(
                              fontSize: 10, color: Colors.orange)),
                    ],
                  ),
                ],
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        Text(
                          soldCount,
                          style:
                              const TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                    // Add to cart button/icon
                    InkWell(
                      onTap: () {/* Handle Add to Cart */},
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(Icons.add_shopping_cart_outlined,
                            size: 18),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
