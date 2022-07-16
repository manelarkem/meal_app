import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get complexityText{
    switch(complexity) {
      case Complexity.Simple: return "Simple";
      case Complexity.Challenging: return "Challenging";
      case Complexity.Hard: return "Hard";
      default: return "Unknown";
    }
  }

  String get affordabilityText{
    switch(affordability) {
      case Affordability.Affordable: return "Affordable";
      case Affordability.Pricey: return "Pricey";
      case Affordability.Luxurious: return "Luxurious";
      default: return "Unknown";
    }
  }

  void selectMeal(ctx) {
    Navigator.of(ctx).pushNamed(
        "meal_detail",
        arguments: id,
    ).then((result) {
      //if (result != null) removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Row(
                    children: [
                      Icon(Icons.access_alarm),
                      SizedBox(width: 7,),
                      Text("$duration min"),
                    ],
                  ),
                  SizedBox(width: 30,),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 7,),
                      Text("$complexityText"),
                    ],
                  ),
                  SizedBox(width: 30,),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 7,),
                      Text("$affordabilityText"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
