import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final int _bottomNavIndex = 2; // Index for 'Trends'

  // Sample data (Replace with your actual data models and sources)
  final List<String> mainCategories = [
    "All",
    "Women",
    "Curve",
    "Kids",
    "Men",
    "Home",
    "Beauty",
    "Electronics"
  ];

  final List<String> sideCategories = [
    "Just For You",
    "New In",
    "Sale",
    "Women Clothing",
    "Beachwear",
    "Curve",
    "Kids",
    "Men Clothing",
    "Shoes",
    "Jewelry & Accessories",
    "Home & Kitchen",
    "Underwear & Sleepwear",
    "Baby & Maternity",
    "Sports & Outdoors",
    "Bags & Luggage",
    "Beauty & Health",
    "Electronics",
    "Home Textiles",
    "Toys & Games",
  ];

  // Placeholder grid data structure
  final List<Map<String, String>> picksForYou = [
    {
      "image": "https://via.placeholder.com/100/f44336/ffffff?text=Watch",
      "label": "Men Quartz Watches"
    },
    {
      "image": "https://via.placeholder.com/100/e8e8e8/000000?text=Shirt",
      "label": "Men Shirt Co-ords"
    },
    {
      "image": "https://via.placeholder.com/100/000000/ffffff?text=Polo",
      "label": "Men Polo Shirts"
    },
    {
      "image": "https://via.placeholder.com/100/ffd54f/000000?text=TShirt",
      "label": "Men T-Shirt Co-ords"
    },
    {
      "image": "https://via.placeholder.com/100/1a237e/ffffff?text=Sweat",
      "label": "Men Sweatshirts"
    },
    {
      "image": "https://via.placeholder.com/100/e91e63/ffffff?text=DIY",
      "label": "False Eyelashes and Adhesives"
    },
    {
      "image": "https://via.placeholder.com/100/546e7a/ffffff?text=Watch",
      "label": "Smart Watches"
    },
    {
      "image": "https://via.placeholder.com/100/c2185b/ffffff?text=Hair",
      "label": "Women Hair Bonnets"
    },
    {
      "image": "https://via.placeholder.com/100/78909c/ffffff?text=Pants",
      "label": "Men Pants"
    },
    {
      "image": "https://via.placeholder.com/100/424242/ffffff?text=Glass",
      "label": "Men Fashion Glasses"
    },
    {
      "image": "https://via.placeholder.com/100/bdbdbd/000000?text=Sweat",
      "label": "Men Sweatpants"
    },
    {
      "image": "https://via.placeholder.com/100/424242/ffffff?text=Hood",
      "label": "Men Hoodies"
    },
  ];

  final List<Map<String, String>> mayAlsoLike = [
    {
      "image": "https://via.placeholder.com/100/004d40/ffffff?text=Suit",
      "label": "Men Suits"
    },
    {
      "image": "https://via.placeholder.com/100/bbdefb/000000?text=Jeans",
      "label": "Tween Girls Jeans"
    },
    {
      "image": "https://via.placeholder.com/100/616161/ffffff?text=Hood",
      "label": "Men Hoodie Co-ords"
    },
    // Add more items if needed
  ];

  @override
  Widget build(BuildContext context) {
    // Using DefaultTabController to manage the state of the TabBar
    return DefaultTabController(
      length: mainCategories.length, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          // Remove the default leading back button if it appears
          automaticallyImplyLeading: false,
          title: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0), // Adjust padding
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                  Icons.camera_alt_outlined), // Placeholder for the right icon
              onPressed: () {
                // Handle camera icon press
              },
            ),
          ],
          bottom: TabBar(
            isScrollable: true, // Allows tabs to scroll horizontally
            indicatorColor:
                Colors.pinkAccent, // Color of the underline indicator
            labelColor: Colors.black, // Color of the selected tab text
            unselectedLabelColor:
                Colors.grey[600], // Color of unselected tab text
            tabs:
                mainCategories.map((category) => Tab(text: category)).toList(),
          ),
        ),
        body: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the top
          children: [
            // Left Side Category List (Fixed Width)
            Container(
              width: 100, // Adjust width as needed
              color: Colors.grey[100], // Slight background color
              child: ListView.builder(
                itemCount: sideCategories.length,
                itemBuilder: (context, index) {
                  bool isSelected =
                      index == 0; // Example: Highlight "Just For You"
                  return Container(
                      color: isSelected ? Colors.white : Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 8.0),
                        child: Text(
                          sideCategories[index],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected ? Colors.black : Colors.grey[700],
                          ),
                        ),
                      ));
                },
              ),
            ),

            // Right Side Content Area (Takes remaining space)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // "Picks for you" Section
                    const Text(
                      "Picks for you",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildProductGrid(picksForYou),

                    const SizedBox(height: 20), // Spacing between sections

                    // "You May Also Like" Section
                    const Text(
                      "You May Also Like",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildProductGrid(mayAlsoLike),
                    const SizedBox(height: 20), // Add padding at the bottom
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build the product grid
  Widget _buildProductGrid(List<Map<String, String>> items) {
    return GridView.builder(
      // Important: Prevent the GridView from scrolling independently within the SingleChildScrollView
      physics: const NeverScrollableScrollPhysics(),
      // Important: Allow the GridView to determine its own height based on content
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 10.0, // Horizontal spacing
        mainAxisSpacing: 10.0, // Vertical spacing
        childAspectRatio: 0.75, // Adjust aspect ratio (width / height)
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40, // Adjust size
              backgroundColor: Colors.grey[300], // Placeholder background
              backgroundImage:
                  NetworkImage(item['image']!), // Use NetworkImage for URLs
              // foregroundImage: AssetImage('path/to/your/asset.png'), // Use AssetImage for local assets
            ),
            const SizedBox(height: 6),
            Text(
              item['label']!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
              maxLines: 2, // Allow text to wrap
              overflow: TextOverflow.ellipsis, // Handle overflow
            ),
          ],
        );
      },
    );
  }
}
