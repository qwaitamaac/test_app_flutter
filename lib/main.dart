import 'package:flutter/material.dart';
import 'data/Meal.dart';
import 'data/myData.dart';
import 'deli_meals_screen.dart';
import 'meal_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  int counter;
  List<Meal> _availableMeals = DUMMY_MEALS;

  @override
  void initState() {
    super.initState();
    counter = counter ?? 0;
  }

  void _decrementCounter(_){
    setState(() {
      counter--;
      print('decrement: $counter');
    });
  }

  void _incrementCounter(_){
    setState(() {
      counter++;
      print('increment: $counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Myapp',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: DeliMeals(
        title: 'My Home Page',
        counter: counter,
        decrementCounter: _decrementCounter,
        incrementCounter: _incrementCounter,
      ),
      routes: <String, WidgetBuilder>{
       '/meals' : (BuildContext context) => MealsScreen(_availableMeals)
      }
    );

  }
}
