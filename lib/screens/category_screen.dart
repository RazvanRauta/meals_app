import 'package:flutter/material.dart';
import '../components/category_meals.dart';
import '../data/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/categoryScreen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
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
