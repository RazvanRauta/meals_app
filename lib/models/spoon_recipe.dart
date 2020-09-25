/* This class is responsible for getting and displaying meals 
in our webview
*/

class SpoonRecipe {
  final String spoonacularSourceUrl;
  final int id, readyInMinutes;
  final String title, image;

  //has Equipment, Ingredients, Steps, e.t.c

  SpoonRecipe({
    this.id,
    this.readyInMinutes,
    this.title,
    this.image,
    this.spoonacularSourceUrl,
  });

//The spoonacularSourceURL displays the meals recipe in our webview

  factory SpoonRecipe.fromMap(Map<String, dynamic> map) {
    return SpoonRecipe(
      id: map['id'],
      image: map['image'],
      title: map['title'],
      readyInMinutes: map['readyInMinutes'],
      spoonacularSourceUrl: map['sourceUrl'],
    );
  }
}
