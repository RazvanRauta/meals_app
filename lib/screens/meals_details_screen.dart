import 'package:flutter/material.dart';

import '../components/meal_details.dart';
import '../data/dummy_data.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const routName = '/mealsDetailsScreen';
  final Function setFavorite;
  final Function isFavorite;

  const MealsDetailsScreen({
    Key key,
    @required this.setFavorite,
    @required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == productId);
    final favorite = isFavorite(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
        ),
        actions: [
          IconButton(
              icon: Icon(favorite ? Icons.star : Icons.star_border),
              onPressed: () => setFavorite(productId))
        ],
      ),
      body: MealDetails(
        meal: selectedMeal,
      ),
    );
  }
}
