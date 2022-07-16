import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleFavorites(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex>=0) {
      setState((){
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    else {
      setState((){
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  void _setFilters(Map<String, bool> filterData){
    setState((){
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters["gluten"]! && !meal.isGlutenFree) {
          return false;
        };
        if(_filters["lactose"]! && !meal.isLactoseFree) {
          return false;
        };
        if(_filters["vegan"]! && !meal.isVegan) {
          return false;
        };
        if(_filters["vegetarian"]! && !meal.isVegetarian) {
          return false;
        };
        return true;
      }).toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        'category_meals': (context) => CategoryMealsScreen(_availableMeals),
        'meal_detail': (context) => MealDetailScreen(_toggleFavorites, _isMealFavorite),
        'filters': (context) => FiltersScreen(_setFilters, _filters),
      },
    );
  }
}
