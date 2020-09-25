import 'package:flutter/material.dart';
import 'package:meals_app/screens/spoon_meal_plan_screen.dart';

import '../components/drawer_content.dart';
import '../models/meal.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/';
  final List<Meal> favoriteMeals;
  const TabsScreen({
    Key key,
    @required this.favoriteMeals,
  }) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages(List<Meal> favoriteMeals) {
    return [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(
          favoriteMeals: favoriteMeals,
        ),
        'title': 'Your Favorites'
      },
      {'page': SpoonMealPlanScreen(), 'title': 'Meal Plans'},
    ];
  }

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerContent(),
      appBar: AppBar(
        title: Text(
          _pages(widget.favoriteMeals)[_selectedPageIndex]['title'],
        ),
      ),
      body: _pages(widget.favoriteMeals)[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text(
              'Categories',
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text(
              'Favorites',
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.settings_input_antenna),
            title: Text(
              'Meal Plans',
            ),
          ),
        ],
      ),
    );
  }
}
