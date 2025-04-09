import 'package:flutter/material.dart';
import 'package:shein_ui_clone/core/media_query_size.dart';

class CategoriesNavBar extends StatelessWidget {
  const CategoriesNavBar({
    super.key,
    required this.categoryIconOnTap,
    required this.categories,
    required this.selectedCategory,
    required this.categoryOnTap,
    required this.isCategory,
  });
  final VoidCallback? categoryIconOnTap;
  final void Function(String category) categoryOnTap;
  final List<String> categories;
  final String selectedCategory;
  final bool isCategory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: categories
              .map(
                (category) => _buildCategoryTab(
                  category,
                  category == selectedCategory,
                  isCategory,
                  categoryOnTap,
                ),
              )
              .toList()),
    );
  }

  Widget _buildCategoryTab(
    String title,
    bool isSelected,
    bool isCategory,
    void Function(String title) onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: GestureDetector(
        onTap: () => onTap(title),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isCategory ? Colors.black : Colors.white,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            if (isSelected)
              Container(
                height: 3,
                width: title.length * 8,
                color: isCategory ? Colors.black : Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
