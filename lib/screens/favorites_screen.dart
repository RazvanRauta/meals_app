import 'package:flutter/material.dart';

import '../components/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favoritesScreen';
  final List<Meal> favoriteMeals;
  const FavoritesScreen({
    Key key,
    @required this.favoriteMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favoriteMeals.isEmpty
          ? Center(
              child: Text('Tou have no favorites yet - start adding some!'),
            )
          : ListView.builder(
              itemBuilder: (context, index) => MealItem(
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability,
                id: favoriteMeals[index].id,
                isSpoonMeal: false,
              ),
              itemCount: favoriteMeals.length,
            ),
    );
  }
}
