import 'package:flutter/material.dart';
import 'package:shein_ui_clone/core/enums/product_categories.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/product_category.dart';

class CategoryCircles extends StatelessWidget {
  const CategoryCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Wrap(
          spacing: 16,
          runSpacing: 8,
          alignment: WrapAlignment.start,
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
