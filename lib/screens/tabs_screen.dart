import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteList;
  const TabsScreen({required this.favoriteList, Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pageList;

  int _currentScreen = 0;

  void _selectedTab(int index) {
    setState(() {
      _currentScreen = index;
    });
  }

  @override
  void initState() {
    _pageList = [
      {"title": "Categories", "page": CategoriesScreen()},
      {
        "title": "Favorites",
        "page": FavoritesScreen(
          favoriteList: widget.favoriteList,
        )
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageList[_currentScreen]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pageList[_currentScreen]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        onTap: _selectedTab,
        currentIndex: _currentScreen,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
