import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/category_item.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
        ),
        drawer: MainDrawer(),
        body: GridView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        children: DUMMY_CATEGORIES
            .map(
              (catData) =>
                  CategoryItem(catData.id, catData.title, catData.color),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }

}