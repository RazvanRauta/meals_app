import 'package:flutter/material.dart';
import 'package:meals_app/components/meal_item.dart';

import '../models/meal.dart';

class CategoryMeals extends StatelessWidget {
  final List<Meal> categoryMeals;
  const CategoryMeals({
    Key key,
    @required this.categoryMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => MealItem(
        title: categoryMeals[index].title,
        imageUrl: categoryMeals[index].imageUrl,
        duration: categoryMeals[index].duration,
        complexity: categoryMeals[index].complexity,
        affordability: categoryMeals[index].affordability,
        id: categoryMeals[index].id,
        isSpoonMeal: false,
      ),
      itemCount: categoryMeals.length,
    );
  }
}
