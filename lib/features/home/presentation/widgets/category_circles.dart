import 'package:flutter/material.dart';
import 'package:shein_ui_clone/core/enums/product_categories.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/product_category.dart';

class CategoryCircles extends StatelessWidget {
  const CategoryCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Wrap(
          spacing: 8,
          runSpacing: 8,
          runAlignment: WrapAlignment.spaceBetween,
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: ProductCategoriesEnum.values
              .map((e) => ProductCategoryWidget(
                    title: e.name,
                    imagePath: e.url,
                    subtitle: '',
                  ))
              .toList()),
    );
  }
}
