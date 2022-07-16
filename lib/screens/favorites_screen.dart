import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Your Favotites",
          ),
        ),
        drawer: MainDrawer(),
        body: Center(
          child: Text("You don't have any favorites yet.",
          style: TextStyle(
            fontSize: 18
          ),),
        ),
      );
    }
    else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Your Favotites",
          ),
        ),
        drawer: MainDrawer(),
        body: ListView.builder(
          itemBuilder: (ctx, index){
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
            );
          },
          itemCount: favoriteMeals.length,
        ),
      );
    }
  }
}
