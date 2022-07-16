import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon, Function() tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 28, color: Colors.blue,),
      title: Text(title, style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.blueGrey,
      ),),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(14,27,10,0),
            color: Colors.blue,
            alignment: Alignment.centerLeft,
            child: Text("Cooking Up!", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),),
          ),
          SizedBox(height: 20,),
          buildListTile("Meals", Icons.restaurant, (){
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListTile("Filters", Icons.settings, (){Navigator.of(context).pushReplacementNamed("filters");}),
        ],
      ),
    );
  }
}
