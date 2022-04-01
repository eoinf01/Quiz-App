import 'package:flutter/cupertino.dart';

class categoryModel{
  late Color color;
  late Color lighterColor;
  late String name;
  late Image image;
  categoryModel(Color color,String heading, Color lColor,image){
    this.color = color;
    this.name = heading;
    this.lighterColor = lColor;
    this.image = image;
  }
}