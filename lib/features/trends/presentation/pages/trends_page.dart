import 'package:flutter/material.dart';

class TrendsPage extends StatefulWidget {
  const TrendsPage({super.key});

  @override
  State<TrendsPage> createState() => _TrendsPageState();
}

final List<Map<String, dynamic>> trendingStoresData = [
  {
    "storeName": "CUCCOO SZL",
    "storeLogoUrl":
        "https://via.placeholder.com/40/FFC107/000000?text=C", // Placeholder logo
    "tags": ["+ New", "Follower surge 61%"],
    "products": [
      {
        "imageUrl": "https://via.placeholder.com/150/eeeeee/000000?text=Shoe1",
        "sold": "100+ sold",
        "price": "\$8.68"
      },
      {
        "imageUrl": "https://via.placeholder.com/150/e0e0e0/000000?text=Shoe2",
        "sold": "80+ sold",
        "price": "\$15.20"
      },
      {
        "imageUrl": "https://via.placeholder.com/150/dddddd/000000?text=Shoe3",
        "sold": "100+ sold",
        "price": "\$17.01"
      },
      {
        "imageUrl": "https://via.placeholder.com/150/cccccc/000000?text=Shoe4",
        "sold": "200+ sold",
        "price": "\$13.77"
      },
    ]
  },
  {
    "storeName": "SHEIN BAE",
    "storeLogoUrl":
        "https://via.placeholder.com/40/E91E63/ffffff?text=S", // Placeholder logo
    "tags": ["Flas", "Follower surge 33%"],
    "products": [
      {
        "imageUrl": "https://via.placeholder.com/150/fce4ec/000000?text=Dress1",
        "sold": "40+ sold",
        "price": "\$13.00"
      },
      {
        "imageUrl": "https://via.placeholder.com/150/f8bbd0/000000?text=Dress2",
        "sold": "60+ sold",
        "price": "\$7.29"
      },
      {
        "imageUrl": "https://via.placeholder.com/150/f48fb1/000000?text=Dress3",
        "sold": "20+ sold",
        "price": "\$11.90"
      },
      {
        "imageUrl": "https://via.placeholder.com/150/f06292/000000?text=Dress4",
        "sold": "100+ sold",
        "price": "\$3.40"
      },
    ]
  },
  {
    "storeName": "Comfortcana",
    "storeLogoUrl":
        "https://via.placeholder.com/40/8BC34A/ffffff?text=C", // Placeholder logo
    "tags": ["Flas", "Follower surge 28%"],
    "products": [
      {
        "imageUrl": "https://via.placeholder.com/150/c8e6c9/000000?text=Top1",
        "sold": "#Eid Soft Pinks",
        "price": "\$11.00"
      }, // Using sold field for tag here based on screenshot
      {
        "imageUrl": "https://via.placeholder.com/150/a5d6a7/000000?text=Top2",
        "sold": "100+ sold",
        "price": "\$9.00"
      },
      {
        "imageUrl": "https://via.placeholder.com/150/81c784/000000?text=Top3",
        "sold": "50+ sold",
        "price": "\$8.36"
      },
      {
        "imageUrl": "https://via.placeholder.com/150/66bb6a/000000?text=Top4",
        "sold": "40+ sold",
        "price": "\$10.00"
      },
    ]
  },
  {
    "storeName": "opoee",
    "storeLogoUrl":
        "https://via.placeholder.com/40/03A9F4/ffffff?text=O", // Placeholder logo
    "tags": ["+ New", "11K Followers"],
    // This section has a different product display style in the screenshot (wider scroll)
    // We'll use the same product item structure for simplicity, but show more items
    "products": [
      {
        "imageUrl": "https://via.placeholder.com/150/b3e5fc/000000?text=ShoeA",
        "sold": "",
        "price": ""
      }, // No price/sold in this style's preview
      {
        "imageUrl": "https://via.placeholder.com/150/81d4fa/000000?text=ShoeB",
        "sold": "",
        "price": ""
      },
      {
        "imageUrl": "https://via.placeholder.com/150/4fc3f7/000000?text=ShoeC",
        "sold": "",
        "price": ""
      },
      {
        "imageUrl": "https://via.placeholder.com/150/29b6f6/000000?text=ShoeD",
        "sold": "",
        "price": ""
      },
      {
        "imageUrl": "https://via.placeholder.com/150/03a9f4/000000?text=ShoeE",
        "sold": "",
        "price": ""
      },
    ]
  },
];
// --- End Sample Data ---

class _TrendsPageState extends State<TrendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trends Store",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            )),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1.0, // Subtle shadow
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(
            top: 8.0, bottom: 16.0), // Add padding top/bottom
        itemCount: trendingStoresData.length,
        itemBuilder: (context, index) {
          final storeData = trendingStoresData[index];
          return _buildStoreSection(storeData);
        },
      ),
    );
  }

  // Builds a single store section Card
  Widget _buildStoreSection(Map<String, dynamic> storeData) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      clipBehavior: Clip.antiAlias, // Ensures content respects border radius
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Store Header ---
            _buildStoreHeader(storeData),
            const SizedBox(height: 12.0),

            // --- Horizontally Scrollable Product List ---
            _buildHorizontalProductList(storeData['products'] ?? []),
          ],
        ),
      ),
    );
  }

  // Builds the header part of the store section
  Widget _buildStoreHeader(Map<String, dynamic> storeData) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, // Align items vertically
      children: [
        // Store Logo (Optional: Use Image.network if URL is provided)
        CircleAvatar(
          radius: 18,
          backgroundImage: NetworkImage(storeData['storeLogoUrl']),
          backgroundColor: Colors.grey[200], // Placeholder bg
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Store Name (Tappable)
              InkWell(
                onTap: () {/* Navigate to Store Page */},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(storeData['storeName'] ?? 'Unknown Store',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    const Icon(Icons.arrow_forward_ios,
                        size: 14, color: Colors.grey),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              // Tags Row
              if (storeData['tags'] != null && storeData['tags'].isNotEmpty)
                Wrap(
                  spacing: 6.0, // Horizontal space between tags
                  runSpacing: 4.0, // Vertical space if tags wrap
                  children: (storeData['tags'] as List<dynamic>)
                      .map((tag) => _buildTagChip(tag.toString()))
                      .toList(),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // Builds a styled tag chip
  Widget _buildTagChip(String label) {
    // Basic styling, customize further as needed
    Color bgColor = Colors.green[50]!;
    Color textColor = Colors.green[700]!;
    if (label.toLowerCase().contains("surge")) {
      bgColor = Colors.blue[50]!;
      textColor = Colors.blue[700]!;
    } else if (label.toLowerCase().contains("flas")) {
      bgColor = Colors.orange[50]!;
      textColor = Colors.orange[700]!;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 10.0, color: textColor, fontWeight: FontWeight.w500),
      ),
    );
  }

  // Builds the horizontal list of products for a store
  Widget _buildHorizontalProductList(List<dynamic> products) {
    // Give items a fixed width to roughly show 4 items initially
    // Adjust this width based on screen size or desired look
    const double itemWidth = 90.0;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: products.map((product) {
          // Add padding between items
          return Padding(
            padding: const EdgeInsets.only(right: 10.0), // Space between items
            child: _buildProductItem(product, itemWidth),
          );
        }).toList(),
      ),
    );
  }

  // Builds a single product item for the horizontal list
  Widget _buildProductItem(Map<String, dynamic> productData, double width) {
    String imageUrl = productData['imageUrl'] ??
        'https://via.placeholder.com/150/e0e0e0/000000?text=N/A';
    String sold = productData['sold'] ?? '';
    String price = productData['price'] ?? '';

    // Determine if this item should show price/sold based on content
    bool showDetails = price.isNotEmpty ||
        (sold.isNotEmpty &&
            !sold.startsWith('#')); // Hide details if only hashtag or empty

    return SizedBox(
      width: width,
      child: InkWell(
        onTap: () {/* Navigate to Product Details */},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                height: 100, // Fixed height for image consistency
                width: width,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 100,
                  width: width,
                  color: Colors.grey[200],
                  child: const Center(
                      child: Icon(
                    Icons.broken_image,
                    color: Colors.grey,
                  )),
                ),
              ),
            ),
            if (showDetails ||
                sold.startsWith(
                    '#')) // Show text area if details exist OR it's a tag
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (sold.isNotEmpty)
                      Text(
                        sold, // Can be sold count or a tag like "#Eid Soft Pinks"
                        style: TextStyle(
                          fontSize: 10,
                          color: sold.startsWith('#')
                              ? Colors.pink
                              : Colors.grey[600], // Different color for tags
                          fontWeight: sold.startsWith('#')
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (showDetails && price.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        price,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
