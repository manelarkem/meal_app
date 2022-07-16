import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutonFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState(){
    _glutonFree = widget.currentFilters["gluten"]!;
    _lactoseFree = widget.currentFilters["lactose"]!;
    _vegan = widget.currentFilters["vegan"]!;
    _vegetarian = widget.currentFilters["vegetarian"]!;
    super.initState();

  }

  Widget buildSwitchListTile(String title, String subtitle, bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton(
              onPressed: (){
                final Map<String, bool> selectedFilters = {
                  "gluten": _glutonFree,
                  "lactose": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian,
                };
                widget.saveFilters(selectedFilters);
                },
              icon: Icon(Icons.save),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection:", style: TextStyle(
              fontSize: 23,
            ),),
          ),
          Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile("Gluten-Free", "Only include Gluten Free meals", _glutonFree, (newValue) {
                    setState((){
                      _glutonFree = newValue;
                    });
                  }),
                  buildSwitchListTile("Lactose-Free", "Only include Lactose Free meals", _lactoseFree, (newValue) {
                    setState((){
                      _lactoseFree = newValue;
                    });
                  }),
                  buildSwitchListTile("Vegetarian", "Only include Vegetarian meals", _vegetarian, (newValue) {
                    setState((){
                      _vegetarian = newValue;
                    });
                  }),
                  buildSwitchListTile("Vegan", "Only include Vegan meals", _vegan, (newValue) {
                    setState((){
                      _vegan = newValue;
                    });
                  }),

                ],
              )
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
