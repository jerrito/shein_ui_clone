import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shein_ui_clone/core/enums/product_categories.dart';
import 'package:shein_ui_clone/core/media_query_size.dart';
import 'package:shein_ui_clone/features/trends/presentation/widgets/trend_image_widget.dart';
import 'package:shein_ui_clone/features/trends/presentation/widgets/trend_search_widget.dart';

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
        "imageUrl": ProductCategoriesEnum.beachwear.url,
        "sold": "100+ sold",
        "price": "\$8.68"
      },
      {
        "imageUrl": ProductCategoriesEnum.bottoms.url,
        "sold": "80+ sold",
        "price": "\$15.20"
      },
      {
        "imageUrl": ProductCategoriesEnum.curve.url,
        "sold": "100+ sold",
        "price": "\$17.01"
      },
      {
        "imageUrl": ProductCategoriesEnum.jewelry.url,
        "sold": "200+ sold",
        "price": "\$13.77"
      },
    ]
  },
  {
    "storeName": "SHEIN BAE",
    "storeLogoUrl": ProductCategoriesEnum.sports.url, // Placeholder logo
    "tags": ["Flas", "Follower surge 33%"],
    "products": [
      {
        "imageUrl": ProductCategoriesEnum.sports.url,
        "sold": "40+ sold",
        "price": "\$13.00"
      },
      {
        "imageUrl": ProductCategoriesEnum.shoes.url,
        "sold": "60+ sold",
        "price": "\$7.29"
      },
      {
        "imageUrl": ProductCategoriesEnum.bottoms.url,
        "sold": "20+ sold",
        "price": "\$11.90"
      },
      {
        "imageUrl": ProductCategoriesEnum.women.url,
        "sold": "100+ sold",
        "price": "\$3.40"
      },
    ]
  },
  {
    "storeName": "Comfortcana",
    "storeLogoUrl": ProductCategoriesEnum.bags.url, // Placeholder logo
    "tags": ["Flas", "Follower surge 28%"],
    "products": [
      {
        "imageUrl": ProductCategoriesEnum.bottoms.url,
        "sold": "#Eid Soft Pinks",
        "price": "\$11.00"
      }, // Using sold field for tag here based on screenshot
      {
        "imageUrl": ProductCategoriesEnum.beachwear.url,
        "sold": "100+ sold",
        "price": "\$9.00"
      },
      {
        "imageUrl": ProductCategoriesEnum.shoes.url,
        "sold": "50+ sold",
        "price": "\$8.36"
      },
      {
        "imageUrl": ProductCategoriesEnum.home.url,
        "sold": "40+ sold",
        "price": "\$10.00"
      },
    ]
  },
  {
    "storeName": "opoee",
    "storeLogoUrl": ProductCategoriesEnum.curve.url, // Placeholder logo
    "tags": ["+ New", "11K Followers"],
    // This section has a different product display style in the screenshot (wider scroll)
    // We'll use the same product item structure for simplicity, but show more items
    "products": [
      {
        "imageUrl": ProductCategoriesEnum.jewelry.url,
        "sold": "",
        "price": ""
      }, // No price/sold in this style's preview
      {
        "imageUrl": ProductCategoriesEnum.shoes.url,
        "sold": "",
        "price": "",
      },
      {"imageUrl": ProductCategoriesEnum.kids.url, "sold": "", "price": ""},
      {"imageUrl": ProductCategoriesEnum.baby.url, "sold": "", "price": ""},
      {
        "imageUrl": ProductCategoriesEnum.activewear.url,
        "sold": "",
        "price": ""
      },
    ]
  },
];
// --- End Sample Data ---

class _TrendsPageState extends State<TrendsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showCompact = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    debugPrint("${(currentOffset) / 200}");
    setState(() {
      currentOffset = _scrollController.offset;
    });
    // print("naj${_scrollController.}");
    if (_scrollController.offset > 220 && !_showCompact) {
      setState(() => _showCompact = true);
    } else if (_scrollController.offset <= 220 && _showCompact) {
      setState(() => _showCompact = false);
    }
  }

  double currentOffset = 0;
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              _showCompact || currentOffset > 120
                  ? SliverAppBar(
                      backgroundColor:
                          _showCompact ? Colors.black : Colors.transparent,
                      pinned: true,
                      toolbarHeight: 50,
                      collapsedHeight: 55,
                      expandedHeight: Sizes.height(context, 0.1),
                      flexibleSpace: SafeArea(
                        child: AnimatedOpacity(
                          opacity:
                              currentOffset < 199 ? (currentOffset) / 200 : 1,
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 10,
                            ),
                            color: _showCompact
                                ? Colors.black
                                : Colors.transparent,
                            child: SizedBox(
                              width: Sizes.width(context, 0.75),
                              height: 50,
                              child: TrendSearchWidget(
                                color: Colors.white,
                                // Background color for the header
                              ),
                            ),
                          ),
                        ),
                      ))
                  : SliverToBoxAdapter(
                      child: SizedBox.shrink(),
                    ),
              SliverToBoxAdapter(
                child: CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1.0,
                      height: Sizes.height(context, 0.4),
                    ),
                    itemCount: 3,
                    itemBuilder: (context, index, ind) {
                      return TrendImageWidget(
                        shape: index == 0
                            ? 'hexagon'
                            : index == 1
                                ? 'diamond'
                                : 'blob',
                        risingPercentage: '${index != 0 ? index * 10 : 4}',
                        daysLeft: "${index != 0 ? index * 2 : 2} days left",
                        hashTag: index == 0
                            ? '#Radiant Glow'
                            : index == 1
                                ? '#Eid Sparkling joy'
                                : '#Lace Accessor',
                        color: index == 1
                            ? const Color.fromARGB(255, 221, 226, 77)
                            : index == 2
                                ? const Color.fromARGB(255, 220, 116, 209)
                                : const Color.fromARGB(255, 140, 197, 100),
                        image: index == 0
                            ? ProductCategoriesEnum.beachwear.url
                            : index == 1
                                ? ProductCategoriesEnum.bottoms.url
                                : ProductCategoriesEnum.jewelry.url,
                      );
                    }),
              ),
              SliverToBoxAdapter(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 16.0), // Add padding top/bottom
                  itemCount: trendingStoresData.length,
                  itemBuilder: (context, index) {
                    final storeData = trendingStoresData[index];
                    return _buildStoreSection(storeData);
                  },
                ),
              ),
            ],
          ),
          !_showCompact && currentOffset < 120
              ? SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: Sizes.width(context, 0.3),
                          child: TrendSearchWidget(
                            color: Colors.white,
                            // Background color for the header
                          ),
                        ),
                        SizedBox(width: Sizes.width(context, 0.02)),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
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
