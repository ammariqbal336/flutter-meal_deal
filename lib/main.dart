import 'package:flutter/material.dart';
import 'package:meatdeals/dummy_data/categories_data.dart';
import 'package:meatdeals/models/meal.dart';
import './screens/filterscreen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_item_detail_screen.dart';
import './screens/category_meal_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    Map<String,bool> _filterItem = {
    "gluten": true,
    "lactose": false,
    "vegan": true,
    "vegeterian": false
  };

   List<Meal> _availableMeal = DUMMY_MEALS;
   List<Meal> _favoriteList = [];

  void _setFilters(Map<String,bool> filter) {
      setState(() {
        _filterItem = filter;

        _availableMeal = DUMMY_MEALS.where((meal){
              if((_filterItem['gluten'] as bool) && !meal.isGlutenFree){
                return false;
              }
              if((_filterItem['lactose'] as bool) && !meal.isLactoseFree){
                return false;
              }
              if((_filterItem['vegan'] as bool) && !meal.isVegan){
                return false;
              }
              if((_filterItem['vegeterian'] as bool) && !meal.isVegetarian){
                return false;
              }
              return true;
        }).toList();
      });
  }
  
  void _toggleFavorite(String mealId){
      final itemIndex = _favoriteList.indexWhere((meal) => meal.id == mealId);
      if(itemIndex >= 0){
        setState(() {
          _favoriteList.removeAt(itemIndex);  
        });
        
      }
      else{
        setState(() {
          _favoriteList.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));  
        });
        
      }
  }

  bool _isFavoriteMeal(String mealID){
      return _favoriteList.any((meal) => meal.id == mealID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        primarySwatch: Colors.pink,
        canvasColor: Colors.white,
        primaryColorDark: Colors.yellow,
        
        //Color.fromARGB(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: Colors.black),
          bodyText2: const TextStyle(color: Colors.black),
          
          headline6: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          )
        )
      ),
      initialRoute: '/',
      routes: {
        '/' : (ctx) =>  TabsScreen(favoriteList: _favoriteList,),
        CategoryMealScreen.routesname:(ctx) =>  CategoryMealScreen(mealList: _availableMeal,),
        MealItemDetailScreen.routesname: (ctx) =>  MealItemDetailScreen(favoritetoggle: _toggleFavorite,isFavorite: _isFavoriteMeal,),
        FilterScreen.routesname: (ctx) =>  FilterScreen(filtervalue: _filterItem,filters: _setFilters,)
      },
    );
  }
}

