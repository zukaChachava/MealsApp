import 'package:flutter/material.dart';

import '../../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const route = '/meal';

  const MealDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: 300,
            width: double.infinity,
            child: Image.network(meal.imageUrl),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
                itemCount: meal.ingredients.length),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Steps",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            child: ListView.separated(
                separatorBuilder: (ctx, index) => const Divider(),
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text('#${index + 1}'),
                    ),
                    title: Text(meal.steps[index]),
                  );
                },
                itemCount: meal.steps.length),
          ),
        ]),
      ),
    );
  }
}
