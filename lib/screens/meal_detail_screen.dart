import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

  final Function toggleFavorites;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorites, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 25, right: 20),
        child: Column(
          children: [
            SizedBox(height: 15,),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Image.network(selectedMeal.imageUrl, width: 300,),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(selectedMeal.title, style: TextStyle(
                  fontSize: 27,
                fontWeight: FontWeight.w600,
                color: Colors.black54
              ),),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text("Ingredients", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),),
            ),
            Expanded(
              child: Container(
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    child: Text(selectedMeal.ingredients[index], style: TextStyle(
                        fontSize: 15,
                    ),),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text("Steps", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),),
            ),
            Expanded(
              child: Container(
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) => ListTile(
                    leading: CircleAvatar(
                      child: Text("${index+1}"),
                    ),
                    title: Text(selectedMeal.steps[index], style: TextStyle(
                      fontSize: 15,
                    ),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorites(mealId),
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
