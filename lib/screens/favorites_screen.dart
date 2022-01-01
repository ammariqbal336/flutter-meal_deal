import 'package:flutter/material.dart';
import 'package:meatdeals/widgets/meal_item.dart';
import '../models/meal.dart';
class FavoritesScreen extends StatelessWidget {

  final List<Meal> favoriteList;
  const FavoritesScreen({required this.favoriteList , Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    if(favoriteList.isEmpty){
      return Center(
        child: Text("No meal is favorite"),
      );
    }
    else {
      return ListView.builder(itemBuilder: (ctx,index){
          return MealItem(displayItem: favoriteList[index],);
     
      },itemCount: favoriteList.length,
      );
    }
  }
}