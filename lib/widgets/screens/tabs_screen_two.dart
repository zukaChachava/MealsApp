import 'package:flutter/material.dart';
import 'package:meals/widgets/items/main_drawer.dart';
import 'package:meals/widgets/screens/categories_screen.dart';
import 'package:meals/widgets/screens/favourites_screen.dart';

class TabScreenTwo extends StatefulWidget {
  const TabScreenTwo({Key? key}) : super(key: key);

  @override
  State<TabScreenTwo> createState() => _TabScreenTwoState();
}

class _TabScreenTwoState extends State<TabScreenTwo> {
  final List<Widget> _pages = [
    const CategoriesScreen(),
    const FavouritesScreen()
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]
            .runtimeType
            .toString()
            .replaceFirst('Screen', '')),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
