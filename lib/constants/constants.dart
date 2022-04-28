import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:theorytest/modals/FavouritesModal.dart';
import 'package:theorytest/modals/MarathonModal.dart';

import '../modals/RapidModal.dart';
import '../models/mode_model.dart';

  final Color lightorangeCard = Color.fromRGBO(245, 200, 114, 1);
  final Color orangeCard = Color.fromRGBO(243, 156, 18, 1);
  const Color blueCard = Color.fromRGBO(52, 152, 219,1);
  final Color lightblueCard = Color.fromRGBO(133, 193, 233, 1);
  final Color primaryBlue = Color.fromRGBO(0, 114, 255, 1);
  final Color darkBlue = Color.fromRGBO(21,53,247, 1);

List<modeModel> models = [modeModel(Colors.white, "Rapidfire", "You only have 30 seconds to answer the questions!", AssetImage("assets/bang.png"),rapidModal()),modeModel(Colors.white, "Marathon", "Answer as many questions you can correctly in a row!", AssetImage("assets/bell.png"),marathonModal()),modeModel(Colors.white, "Favourites", "Answer as many questions you can correctly in a row!", AssetImage("assets/bell.png"),favouritesModal())];