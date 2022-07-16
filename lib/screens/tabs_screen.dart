import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String, Widget>>? _pages;

  int _selectPageIndex = 0;

  void _selectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages?[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectPageIndex,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined, color: Colors.black,),
            label: "Categories"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, color: Colors.black,),
            label: "Favorites"
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

}
