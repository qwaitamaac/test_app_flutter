import 'package:flutter/material.dart';
import 'package:test_app/data/Meal.dart';
import '../meal_screen.dart';


class MealItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageurl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function onRemoveFn;
  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageurl,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
    this.onRemoveFn,
  });

  String get complexityText {
    String val;
    switch (this.complexity) {
      case Complexity.Simple:
        val = "Simple";
        break;
      case Complexity.Challenging:
        val = "Challenging";
        break;
      case Complexity.Hard:
        val = "Hard";
        break;
    }
    return val;
  }

  String get affordabilityText {
    String val;
    switch (this.affordability) {
      case Affordability.Affordable:
        val = "Affordable";
        break;
      case Affordability.Pricey:
        val = "Pricey";
        break;
      case Affordability.Luxurious:
        val = "Luxurious";
        break;
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all((10)),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                    child: Image.network(
                      imageurl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 14,
                    child: Container(
                      width: 400,
                      child: Text(
                        title,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            shadows: [
                              BoxShadow(
                                  offset: Offset(3.0, 3.0),
                                  blurRadius: 4.0,
                                  color: Colors.black)
                            ]),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text('$duration min')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text('$complexityText')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(width: 6),
                        Text('$affordabilityText')
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
