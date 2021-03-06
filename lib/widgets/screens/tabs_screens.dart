import 'package:flutter/material.dart';
import 'package:meals/widgets/screens/categories_screen.dart';
import 'package:meals/widgets/screens/favourites_screen.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meals"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favourites",
              ),
            ],
          ),
        ),
        body: const TabBarView(
            children: [CategoriesScreen(), FavouritesScreen()]),
      ),
    );
  }
}
