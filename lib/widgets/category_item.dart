import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category data;
  
  const CategoryItem({Key? key, required this.data})
      : super(key: key);


  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealScreen.routesname,arguments: {
        "category": data
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Text(data.title,style: Theme.of(context).textTheme.headline6,),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [data.color.withOpacity(0.7), data.color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
