import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:theorytest/models/question.dart';

class onboardController extends GetxController{


  RxString buttontext= "Next".obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController textController;
  late PageController controller;
  late PageController imageController;
  late RxInt pageIndex;
  int totalPages = 2;
  bool showButton = false;
  final List<double> initScore = [0.0,0.0,0.0,0.0,0.0];

  final box = GetStorage();

  @override
  void onInit() {
    box.write("fav", []);
    HashMap<String,List<double>> scores = new HashMap();
    scores.putIfAbsent("rapid", () => initScore);
    scores.putIfAbsent("practice", () => initScore);
    scores.putIfAbsent("marathon", () => initScore);
    scores.putIfAbsent("favourites", () => initScore);
    box.write("scores", scores);
    box.write("incorrect", 0);
    box.write("questions", jsonEncode(sample_date));

    textController = TextEditingController();
    imageController = PageController(initialPage: 0,viewportFraction: 1);
    pageIndex = 0.obs;
    controller = PageController(initialPage: 0,viewportFraction: 1);
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
    textController.dispose();
    imageController.dispose();
  }

  setPrefValue(username) async{
    box.write("onboarding", true);
    box.write("username", username);
  }
}