import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String? categoryTitle;
  List<Meal> displayMeals = [];

  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    displayMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  /*void _removeMeal(String mealId) {
    setState((){
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });

  }*/


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryTitle Meals"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index){
                return MealItem(
                  id: displayMeals[index].id,
                  title: displayMeals[index].title,
                  imageUrl: displayMeals[index].imageUrl,
                  duration: displayMeals[index].duration,
                  complexity: displayMeals[index].complexity,
                  affordability: displayMeals[index].affordability,
                );
              },
              itemCount: displayMeals.length,
            ),
          ),
        ],
      ),
      );
  }
}
