import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:meals/dymmy_data/categories.dart';
import 'package:meals/widgets/category_item_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meals")),
      body: GridView(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: categories
              .map((category) => CategoryItemWidget(category: category))
              .toList()),
    );
  }
}
