import 'package:flutter/material.dart';

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
      itemBuilder: (context, index) => Text(
        categoryMeals[index].title,
      ),
      itemCount: categoryMeals.length,
    );
  }
}
