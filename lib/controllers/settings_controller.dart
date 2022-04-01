import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class settingController extends GetxController with GetSingleTickerProviderStateMixin{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController displayTextController;
  final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
    displayTextController = TextEditingController(text: box.read("username"));
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
}