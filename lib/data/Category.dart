import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/colors.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
   this.id,this.title,this.color = Colors.blue
});
}