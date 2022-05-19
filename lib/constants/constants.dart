import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:theorytest/modals/FavouritesModal.dart';
import 'package:theorytest/modals/MarathonModal.dart';

import '../modals/RapidModal.dart';
import '../models/category_model.dart';
import '../models/mode_model.dart';
import '../models/question.dart';

final Color lightorangeCard = Color.fromRGBO(245, 200, 114, 1);
final Color orangeCard = Color.fromRGBO(243, 156, 18, 1);
const Color blueCard = Color.fromRGBO(52, 152, 219, 1);
final Color lightblueCard = Color.fromRGBO(133, 193, 233, 1);
final Color primaryBlue = Color.fromRGBO(0, 114, 255, 1);
final Color darkBlue = Color.fromRGBO(21, 53, 247, 1);

List<modeModel> models = [
  modeModel(
      Colors.white,
      "Rapidfire",
      "You only have 30 seconds to answer the questions!",
      AssetImage("assets/bang.png"),
      rapidModal()),
  modeModel(
      Colors.white,
      "Marathon",
      "Answer as many questions you can correctly in a row!",
      AssetImage("assets/bell.png"),
      marathonModal()),
  modeModel(
      Colors.white,
      "Favourites",
      "Answer as many questions you can correctly in a row!",
      AssetImage("assets/bell.png"),
      favouritesModal())
];

List<categoryWidgetModel> list = [
  categoryWidgetModel(
    category: Category(id: 1, name: "Rules of the Road"),
    color: orangeCard,
    lighterColor: lightorangeCard,
    image: new Image.asset("assets/alarm.png"),
    background: "assets/blob-scene-haikei-4.png",
  ),
  categoryWidgetModel(
    category: Category(id: 1, name: "Safety Rules"),
    color: blueCard,
    lighterColor: lightblueCard,
    image: new Image.asset("assets/law.png"),
    background: "assets/blob-scene-haikei-3.png",
  ),
  categoryWidgetModel(
    category: Category(id: 2, name: "Rules of the Road"),
    color: orangeCard,
    lighterColor: lightorangeCard,
    image: new Image.asset("assets/alarm.png"),
    background: "assets/blob-scene-haikei-4.png",
  ),
  categoryWidgetModel(
    category: Category(id: 3, name: "Managing Risk"),
    color: Color.fromRGBO(46, 204, 113, 1),
    lighterColor: Color.fromRGBO(176, 247, 206, 1),
    image: new Image.asset("assets/alarm.png"),
    background: "assets/blob-scene-haikei-3.png",
  ),
  categoryWidgetModel(
    category: Category(id: 3, name: "Control of the Vehicle"),
    color: Color.fromARGB(255, 237, 71, 10),
    lighterColor: Color.fromARGB(255, 255, 166, 110),
    image: new Image.asset("assets/law.png"),
    background: "assets/blob-scene-haikei-3.png",
  ),
];
