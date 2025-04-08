import 'package:flutter/material.dart';
import 'package:shein_ui_clone/core/enums/product_categories.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/category_nav_bar.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/header_section.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/product_category.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<String> categories = [
    "All",
    "Women",
    "Curve",
    "Kids",
    "Men",
    "Home",
    "Beauty",
    "Electronics"
  ];
  String selectedCategory = 'All';

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

  @override
  Widget build(BuildContext context) {
    // Using DefaultTabController to manage the state of the TabBar
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: HeaderSection(
          isCategory: true,
          color: Colors.transparent, // Background color for the header
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Row(
            children: [
              Expanded(
                child: CategoriesNavBar(
                  isCategory: true,
                  selectedCategory: selectedCategory,
                  categories: categories,
                  categoryIconOnTap: null,
                  categoryOnTap: (string) => setState(() {
                    selectedCategory = string;
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
        children: [
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
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const CategoryGrid(),

                  const SizedBox(height: 20), // Spacing between sections

                  // "You May Also Like" Section
                  const Text(
                    "You May Also Like",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const CategoryGrid(),
                  const SizedBox(height: 20), // Add padding at the bottom
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget to build the product grid
}

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      // Important: Allow the GridView to determine its own height based on content
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 10.0, // Horizontal spacing
        mainAxisSpacing: 10.0, // Vertical spacing
        childAspectRatio: 0.75, // Adjust aspect ratio (width / height)
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        // final item = items[index];
        final items = ProductCategoriesEnum.values[index];
        return ProductCategoryWidget(
          isCategory: true,
          title: items.name,
          subtitle: '',
          imagePath: items.url,
        );

        //  Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     CircleAvatar(
        //       radius: 40, // Adjust size
        //       backgroundColor: Colors.grey[300], // Placeholder background
        //       backgroundImage:
        //           NetworkImage(item['image']!), // Use NetworkImage for URLs
        //       // foregroundImage: AssetImage('path/to/your/asset.png'), // Use AssetImage for local assets
        //     ),
        //     const SizedBox(height: 6),
        //     Text(
        //       item['label']!,
        //       textAlign: TextAlign.center,
        //       style: const TextStyle(fontSize: 12),
        //       maxLines: 2, // Allow text to wrap
        //       overflow: TextOverflow.ellipsis, // Handle overflow
        //     ),
        //   ],
        // );
      },
    );
  }
}
