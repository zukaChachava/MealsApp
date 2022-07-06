import 'package:flutter/material.dart';

import '../../models/meal.dart';
import '../screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({required this.meal, Key? key}) : super(key: key);

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailsScreen.route, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  meal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.all(10),
                  color: Colors.black54,
                  child: Text(
                    meal.title,
                    style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(children: [
                  const Icon(Icons.schedule),
                  const SizedBox(
                    width: 6,
                  ),
                  Text('${meal.duration} min'),
                ]),
                Row(children: [
                  const Icon(Icons.work),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(meal.complexity.name),
                ]),
                Row(children: [
                  const Icon(Icons.attach_money),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(meal.affordability.name),
                ]),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
