import 'package:flutter/material.dart';
import 'package:test_app/widgets/meal_item.dart';
import 'data/Meal.dart';

class MealsScreen extends StatefulWidget {
  static const String  route = "/meals";

  final List<Meal> availableMeals;
  MealsScreen(this.availableMeals);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen>{
  String categoryTitle;
  List<Meal> displayerMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!this._loadedInitData) {
      final routeArgs =
      ModalRoute.of(context).settings.arguments as Map<String, String>;

      String categoryId = routeArgs["id"];
      this.categoryTitle = routeArgs["title"];
      this.displayerMeals = widget.availableMeals
          .where((x) => x.categories.contains(categoryId))
          .toList();

      this._loadedInitData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      this.displayerMeals.removeWhere((e) => e.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (ctx, i) => MealItem(
            id: displayerMeals[i].id,
            title: displayerMeals[i].title,
            affordability: displayerMeals[i].affordability,
            complexity: displayerMeals[i].complexity,
            duration: displayerMeals[i].duration,
            imageurl: displayerMeals[i].imageUrl,
            onRemoveFn: _removeMeal,
          ),
          itemCount: displayerMeals.length,
        ));
  }


}

