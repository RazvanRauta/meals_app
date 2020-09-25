import 'package:flutter/material.dart';
import 'package:meals_app/models/spoon_recipe.dart';
import 'package:meals_app/screens/meals_details_screen.dart';
import 'package:meals_app/screens/spoon_meal_recipe_screen.dart';
import 'package:meals_app/services/api_services.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isSpoonMeal;
  final int servings;
  const MealItem(
      {Key key,
      @required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      this.isSpoonMeal,
      this.servings})
      : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';

      case Complexity.Hard:
        return 'Hard';

      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(ctx) {
    Navigator.pushNamed(ctx, MealsDetailsScreen.routName, arguments: id);
  }

  void fetchInfo(BuildContext context, String id) async {
    SpoonRecipe recipe = await ApiService.instance.fetchRecipe(id);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => SpoonRecipeScreen(
                  recipe: recipe,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isSpoonMeal ? fetchInfo(context, id) : selectMeal(context),
      child: Card(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  if (!isSpoonMeal)
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(complexityText)
                      ],
                    ),
                  if (!isSpoonMeal)
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityText)
                      ],
                    ),
                  if (isSpoonMeal)
                    Row(
                      children: [
                        Icon(
                          Icons.restaurant_menu,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text('Servings $servings')
                      ],
                    )
                ],
              ),
            )
          ],
        ),
        margin: const EdgeInsets.all(10),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
