import 'package:flutter/cupertino.dart';

class modeModel{
  late Color color;
  late String name;
  late String subtext;
  late AssetImage image;
  late StatelessWidget widget;
  modeModel(Color color,String heading,String subtext,image,widget){
    this.color = color;
    this.name = heading;
    this.image = image;
    this.subtext = subtext;
    this.widget = widget;
  }
}