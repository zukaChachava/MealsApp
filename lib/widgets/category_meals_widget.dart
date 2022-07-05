import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/widgets/meal_item.dart';
import '../dymmy_data/meals.dart';

class CategoryMealsWidget extends StatelessWidget {
  static const route = '/categories';

  Category? category;
  CategoryMealsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context)!.settings.arguments as Category;
    final filteredMeals =
        meals.where((meal) => meal.categories.contains(category!.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category?.title ?? "test"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(meal: filteredMeals[index]);
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
