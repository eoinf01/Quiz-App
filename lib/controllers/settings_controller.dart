import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:theorytest/models/question.dart';

class settingController extends GetxController with GetSingleTickerProviderStateMixin{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController displayTextController;
  final box = GetStorage();
  late RxString username = "".obs;
  final List<double> initScore = [0.0,0.0,0.0,0.0,0.0];
  @override
  void onInit() {
    super.onInit();
    username.value = box.read("username");
    box.listenKey("username", (value) {
      username.value = value;
    });
    displayTextController = TextEditingController(text: username.value);
  }

  @override
  void onClose() {
    super.onClose();
    displayTextController.dispose();
  }

  String? validateText(String text){
    if(text.isNotEmpty && text.length< 12){
      return null;
    }
    if(text.length> 12){
      return "Profile name must be less than 12 characters.";
    }
  }

  void updateSettings(){
    box.write("username",displayTextController.value.text);
  }

  void resetStatistics(){
    box.write("fav", []);
    HashMap<String,List<double>> scores = new HashMap();
    scores.putIfAbsent("rapid", () => initScore);
    scores.putIfAbsent("practice", () => initScore);
    scores.putIfAbsent("marathon", () => initScore);
    box.write("scores", scores);
    box.write("incorrect", 0);
    box.write("questions",sample_date);
    Get.snackbar("Success", "Your settings have been updated successfully",
    snackPosition: SnackPosition.BOTTOM);
  }
}