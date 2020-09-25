import 'package:flutter/material.dart';

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
              itemCount: favoriteMeals.length,
              itemBuilder: (context, index) => Text(
                favoriteMeals[index].title,
              ),
            ),
    );
  }
}
