import 'package:meals_app/models/spoon_meal.dart';

class SpoonMealPlan {
  //MealPlan class has a list of meals and nutritional info about the meal plan
  final List<SpoonMeal> meals;
  final double calories, carbs, fat, protein;

  SpoonMealPlan(
      {this.meals, this.calories, this.carbs, this.fat, this.protein});

/*
The factory constructor iterates over the list of meals and our decoded mealplan
data and creates a list of meals.
Then, we return MealPlan object with all the information 
*/

  factory SpoonMealPlan.fromMap(Map<String, dynamic> map) {
    List<SpoonMeal> meals = [];
    map['meals'].forEach((mealMap) => meals.add(SpoonMeal.fromMap(mealMap)));
    //MealPlan object with information we want
    return SpoonMealPlan(
      meals: meals,
      calories: map['nutrients']['calories'],
      carbs: map['nutrients']['carbohydrates'],
      fat: map['nutrients']['fat'],
      protein: map['nutrients']['protein'],
    );
  }
}
