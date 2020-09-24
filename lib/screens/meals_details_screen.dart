import 'package:flutter/material.dart';

import '../components/meal_details.dart';
import '../data/dummy_data.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const routName = '/mealsDetailsScreen';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
        ),
      ),
      body: MealDetails(
        meal: selectedMeal,
      ),
    );
  }
}
