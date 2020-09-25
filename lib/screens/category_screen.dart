import 'package:flutter/material.dart';

import '../components/category_meals.dart';
import '../models/meal.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/categoryScreen';
  final List<Meal> availableMeals;

  const CategoryScreen({
    Key key,
    @required this.availableMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: CategoryMeals(
        categoryMeals: categoryMeals,
      ),
    );
  }
}
