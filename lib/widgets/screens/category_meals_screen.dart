import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/widgets/items/meal_item.dart';
import '../../dymmy_data/meals.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const route = '/categories';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context)!.settings.arguments as Category;
    final filteredMeals =
        meals.where((meal) => meal.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
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
