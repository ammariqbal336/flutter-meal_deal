import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {

 final Map<String,bool> filtervalue;
Function filters;

  FilterScreen({required this.filtervalue,required this.filters,Key? key, }) : super(key: key);
  static const routesname = "/filterscreen";

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree  = false;
  var _islactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

    @override
    initState(){
      setState(() {
        _isGlutenFree = widget.filtervalue['gluten'] as bool;
        _isVegan = widget.filtervalue['vegan'] as bool;
        _islactoseFree = widget.filtervalue['lactose'] as bool;
        _isVegetarian = widget.filtervalue['vegeterian'] as bool;
      });
      super.initState();
    } 
  Widget _buildListItem(
      String title, String subtitle, bool selectedValue, Function valChanged) {
    return SwitchListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        subtitle: Text(subtitle),
        value: selectedValue,
        onChanged:(val) =>valChanged(val),
      );
     
  }

   _saveFilter(){
      Map<String,bool> _;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton( icon: const Icon(Icons.save),onPressed: (){
              final filterItem = {
                "gluten": _isGlutenFree,
                "lactose": _islactoseFree,
                "vegan": _isVegan,
                "vegeterian": _isVegetarian
              };
              widget.filters(filterItem);
              
          },),
        ]   ,
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          _buildListItem(
            "GlutenFree",
            "Only include gluten free meals",
            _isGlutenFree,
            (value) {
              setState(() {
                _isGlutenFree = value;
              });
            },
          ),
          _buildListItem(
            "Lactose Free",
            "Only include lactose free meals",
            _islactoseFree,
            (val) {
              setState(() {
                _islactoseFree = val;
              });
            },
          ),
          _buildListItem(
            "Vegan",
            "Only include vegan meals",
            _isVegan,
            (val) {
              setState(() {
                _isVegan = val;
              });
            },
          ),
          _buildListItem(
            "Vegetarian",
            "Only include vegetarian meals",
            _isVegetarian,
            (val) {
              setState(() {
                _isVegetarian = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
