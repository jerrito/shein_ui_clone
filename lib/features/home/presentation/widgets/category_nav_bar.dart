import 'package:flutter/material.dart';

class CategoriesNavBar extends StatelessWidget {
  const CategoriesNavBar({
    super.key,
    required this.categoryIconOnTap,
    required this.categories,
    required this.selectedCategory,
    required this.categoryOnTap,
  });
  final VoidCallback? categoryIconOnTap;
  final void Function(String category) categoryOnTap;
  final List<String> categories;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: categories
            .map(
              (category) => _buildCategoryTab(
                category,
                category == selectedCategory,
                categoryOnTap,
              ),
            )
            .toList());
  }

  Widget _buildCategoryTab(
    String title,
    bool isSelected,
    void Function(String title) onTap,
  ) {
    return GestureDetector(
      onTap: () => onTap(title),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              height: 3,
              width: 30,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}
