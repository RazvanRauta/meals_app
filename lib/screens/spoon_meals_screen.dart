import 'package:flutter/material.dart';

import 'package:meals_app/components/meal_item.dart';
import 'package:meals_app/models/spoon_meal.dart';
import 'package:meals_app/models/spoon_meal_plan.dart';
import 'package:meals_app/services/api_services.dart';

class SpoonMealsScreen extends StatefulWidget {
  //It returns a final mealPlan variable
  final SpoonMealPlan mealPlan;
  final double targetCalories;
  final String diet;

  SpoonMealsScreen({
    Key key,
    @required this.mealPlan,
    @required this.targetCalories,
    @required this.diet,
  }) : super(key: key);

  @override
  _SpoonMealsScreenState createState() => _SpoonMealsScreenState();
}

class _SpoonMealsScreenState extends State<SpoonMealsScreen> {
  SpoonMealPlan _mealPlan;

  @override
  initState() {
    _mealPlan = widget.mealPlan;
    super.initState();
  }

  void _handleRefresh() async {
    final newMealPlan = await ApiService.instance.generateMealPlan(
      targetCalories: widget.targetCalories.toInt(),
      diet: widget.diet,
    );
    setState(() {
      _mealPlan = newMealPlan;
    });
  }

/*
Returns aContainer with Curved edges and a BoxShadow. 
The child is a column widget that returns nutrient information in Rows
 */
  _buildTotalNutrientsCard() {
    return Container(
      height: 140,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 2), blurRadius: 6)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Total Nutrients',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Calories: ${_mealPlan.calories.toString()} cal',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Protein: ${_mealPlan.protein.toString()} g',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Fat: ${_mealPlan.fat.toString()} g',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Carb: ${_mealPlan.carbs.toString()} cal',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

//This method below takes in parameters meal and index
  _buildMealCard(SpoonMeal meal, int index) {
    return MealItem(
      id: meal.id.toString(),
      title: meal.title,
      imageUrl: meal.imgURL,
      duration: meal.duration,
      complexity: null,
      affordability: null,
      isSpoonMeal: true,
      servings: meal.servings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //has an appBar
      appBar: AppBar(title: Text('Your Meal Plan')),
      //and body as a ListView builder
      body: ListView.builder(
        /*
        We set itemCount to 1 + no. of meals, which based on our API call,
        the no. of meals should always be 3
        */
        itemCount: 1 + _mealPlan.meals.length,
        itemBuilder: (BuildContext context, int index) {
          /*
            If index is 0, we return a method called _buildTotalNutrientsCard()
            */
          if (index == 0) {
            return _buildTotalNutrientsCard();
          }
          /*
            Otherwise, we return a buildMealCard method that takes in the meal,
            and index - 1
            */
          SpoonMeal meal = _mealPlan.meals[index - 1];
          return _buildMealCard(meal, index - 1);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleRefresh,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
