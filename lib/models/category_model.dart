import 'package:flutter/cupertino.dart';
import 'package:theorytest/models/question.dart';

class categoryWidgetModel {
  final Color color;
  final Color lighterColor;
  final Image image;
  final String background;
  final Category category;
  categoryWidgetModel(
      {required this.color,
      required this.lighterColor,
      required this.image,
      required this.background,
      required this.category});
}
