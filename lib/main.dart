import 'package:flutter/material.dart';
import 'package:meals/widgets/categories_widget.dart';
import 'package:meals/widgets/category_meals_widget.dart';

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
      home: const CategoriesWidget(),
      routes: {CategoryMealsWidget.route: (context) => CategoryMealsWidget()},
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
