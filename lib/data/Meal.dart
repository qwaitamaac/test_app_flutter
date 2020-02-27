import 'package:test_app/data/Category.dart';

enum Affordability { Affordable, Pricey, Luxurious }
enum Complexity { Simple, Challenging, Hard }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal(
      {this.id,
      this.categories,
      this.title,
      this.affordability,
      this.complexity,
      this.imageUrl,
      this.duration,
      this.ingredients,
      this.steps,
      this.isGlutenFree,
      this.isVegan,
      this.isVegetarian,
      this.isLactoseFree});


  String get affordabilityText{
    var i = Affordability.Affordable;
    switch (this.affordability) {
      case Affordability.Affordable:
        i = Affordability.Affordable;
        break;
      case Affordability.Pricey:
        i = Affordability.Pricey;
        break;
      case Affordability.Luxurious:
        i = Affordability.Luxurious;
        break;
      default:
    }
  }


  String get complexityText{
    var z = Complexity.Simple;
    switch (this.complexity) {
      case Complexity.Challenging:
        z = Complexity.Challenging;
        break;
      case Complexity.Hard:
        z = Complexity.Hard;
        break;
      case Complexity.Simple:
        z = Complexity.Simple;
        break;
      default:
    }
  }
}
