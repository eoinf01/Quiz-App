import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class onboardController extends GetxController{


  RxString buttontext= "Next".obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validatian = true;
  late TextEditingController textController;
  late PageController controller;
  late PageController imageController;
  late RxInt pageIndex;
  double growStepWidth = 0.0;
  double beginWidth=0.0;
  double endWidth = 0.0;
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
    box.write("scores", scores);

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