import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String Id;
  final String title;
  final Color color;

  CategoryItem(this.Id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
        'category_meals',
        arguments: {
          'id': Id,
          'title': title,
        } );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){selectCategory(context);},
      splashColor: Colors.green ,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Padding(
          padding:EdgeInsets.all(15) ,
          child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blue),),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.5),
          gradient: LinearGradient(
            colors:[
              color.withOpacity(0.5),
              color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: color,
          borderRadius: BorderRadius.circular(15)
        ),
        )
    );
  }
}
