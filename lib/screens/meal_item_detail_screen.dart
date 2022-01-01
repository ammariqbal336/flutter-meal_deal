import 'package:flutter/material.dart';
import 'package:meatdeals/models/meal.dart';

class MealItemDetailScreen extends StatelessWidget {
  static String routesname = "/mealDetail";

  final Function favoritetoggle;
  final Function isFavorite;
  const MealItemDetailScreen({required this.favoritetoggle,required this.isFavorite, Key? key}) : super(key: key);


  Widget buildSectionHeader(BuildContext context, String text) {
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline6,
            ),
          );
  }
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 280,
              width: double.infinity,
              child: Image.network(data.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionHeader(context, "Ingrediants"),
            ...data.ingredients.map((e) {
              return Card(
                elevation: 0,
                child: Container(
                  width: 300,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    e,
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                color: Colors.pink,
              );
            }).toList(),
            buildSectionHeader(context, "Steps"),
          
            ...data.steps.map((e) {
              
              return Container(
                width: 300,
                child: Column(
                  children: [
                    ListTile(
                      
                      leading: const CircleAvatar(child: Icon(Icons.food_bank_sharp,color: Colors.white ,),backgroundColor: Colors.pink,),
                      title: Text(e),
                    ),
                    const Divider()
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        child: isFavorite(data.id)?  Icon(Icons.favorite):Icon(Icons.favorite_border),
        onPressed:() => favoritetoggle(data.id),
      ),
    );
  }
}
