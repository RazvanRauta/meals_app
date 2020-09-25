class SpoonMeal {
  final int id;
  final int duration;
  final int servings;
  final String title, imgURL, sourceUrl;

  SpoonMeal(
      {this.id,
      this.title,
      this.imgURL,
      this.duration,
      this.sourceUrl,
      this.servings});

//This class has an ID which allows us to get the Recipes and other info
//Such as title and Image URL

/*
Factory Constructor Meal.fromMap parses the decoded JSON data to get the 
values of the meal, and returns the Meal Object
*/

  factory SpoonMeal.fromMap(Map<String, dynamic> map) {
    //Meal object
    return SpoonMeal(
      id: map['id'],
      title: map['title'],
      duration: map['readyInMinutes'],
      sourceUrl: map['sourceUrl'],
      servings: map['servings'],
      imgURL:
          'https://spoonacular.com/recipeImages/${map['id']}-480x360.${map['imageType']}',
    );
  }
}
