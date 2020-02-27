import 'package:flutter/material.dart';
import 'data/myData.dart';
import 'widgets/category_Item.dart';

class DeliMeals extends StatefulWidget{
  DeliMeals({ Key key,
    this.title,
    this.counter,
    this.decrementCounter,
    this.incrementCounter,})
      :super(key: key);

  final String title;
  final int counter;
  final ValueChanged<void> decrementCounter;
  final ValueChanged<void> incrementCounter;

  @override
  State<StatefulWidget> createState() {
    return _DeliMealState();
  }
}

class _DeliMealState extends State<DeliMeals>{
  void _onPressed() {
    widget.incrementCounter(null);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("DeliMeals",style: TextStyle(color: Colors.white),),
      ),
       body: new GridView(
           padding: const EdgeInsets.all(10),
           children: DUMMY_CATEGORIES
           .map((data) => CategoryItem(data.id,data.title,data.color))
           .toList(),
           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
               maxCrossAxisExtent: 200,
               childAspectRatio: 3 / 2,
               crossAxisSpacing: 20,
               mainAxisSpacing: 20),
       ),
    );

  }

}
