import 'package:meals_app/screens/spoon_meal_plan_screen.dart';

import '../models/meal.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/meals_details_screen.dart';
import '../screens/category_screen.dart';

import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes(
    Map<String, bool> filters,
    Function setFilters,
    List<Meal> availableMeals,
    List<Meal> favoriteMeals,
    Function setFavorite,
    Function isFavorite) {
  return <String, WidgetBuilder>{
    TabsScreen.routeName: (ctx) => TabsScreen(
          favoriteMeals: favoriteMeals,
        ),
    CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
    CategoryScreen.routeName: (ctx) => CategoryScreen(
          availableMeals: availableMeals,
        ),
    MealsDetailsScreen.routName: (ctx) => MealsDetailsScreen(
          setFavorite: setFavorite,
          isFavorite: isFavorite,
        ),
    FavoritesScreen.routeName: (ctx) => FavoritesScreen(
          favoriteMeals: favoriteMeals,
        ),
    FiltersScreen.routeName: (ctx) => FiltersScreen(
          setFilters: setFilters,
          currentFilters: filters,
        ),
    SpoonMealPlanScreen.routeName: (ctx) => SpoonMealPlanScreen()
  };
}
