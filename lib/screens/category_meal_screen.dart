import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data/categories_data.dart';

import '../models/category.dart';

class CategoryMealScreen extends StatefulWidget {

  final List<Meal> mealList;
  static String routesname = "/category-meals";
  const CategoryMealScreen({required this.mealList,  Key? key}) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}



class _CategoryMealScreenState extends State<CategoryMealScreen> {
  
  late List<Meal> displayList;
  late Category data;
  bool _isLoaded = false;
  
  void _removeItem (String id){
    setState(() {
      displayList.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  void didChangeDependencies() {
   
    super.didChangeDependencies();
     if(!_isLoaded) {
        final args =
            ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
        data = args['category'] as Category;

        displayList = widget.mealList.where((meal){
          return meal.categories.contains(data.id);
        }).toList();

        _isLoaded = true;
     }
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title, style: const TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
          return MealItem(displayItem: displayList[index],);
     
      },itemCount: displayList.length,
      ),
    );
  }
}


