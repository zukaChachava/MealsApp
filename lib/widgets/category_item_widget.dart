import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/widgets/category_meals_widget.dart';

import '../models/category.dart';

class CategoryItemWidget extends StatelessWidget {
  final Category category;

  const CategoryItemWidget({required this.category, Key? key})
      : super(key: key);

  void onTap(BuildContext context) {
    Navigator.of(context)
        .pushNamed(CategoryMealsWidget.route, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [category.color.withOpacity(0.7), category.color])),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
