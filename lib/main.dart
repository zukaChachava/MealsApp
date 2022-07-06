import 'package:flutter/material.dart';
import 'package:meals/widgets/screens/tabs_screen_two.dart';
import 'package:meals/widgets/screens/tabs_screens.dart';
import './widgets/screens/category_meals_screen.dart';
import 'package:meals/widgets/screens/categories_screen.dart';
import 'package:meals/widgets/screens/meal_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.red,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(color: Colors.black, fontSize: 20),
              displayMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ))),
      home: const TabScreenTwo(),
      routes: {
        CategoryMealsScreen.route: (context) => const CategoryMealsScreen(),
        MealDetailsScreen.route: (context) => const MealDetailsScreen()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text("Test"),
      ),
    );
  }
}
