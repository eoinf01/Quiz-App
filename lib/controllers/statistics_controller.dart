import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class statsController extends GetxController with GetSingleTickerProviderStateMixin{

  final GetStorage box = GetStorage();
  late RxInt incorrectQuestions = 0.obs;
  late int correctQuestions = 40;
  final RxInt correctPercentage = 0.obs;
  late AnimationController _animationController;
  late Animation<int> _animation;
  AnimationController get getAnimationController => this._animationController;
  Animation get getAnimation => this._animation;

  @override
  void onInit() {
    super.onInit();
    incorrectQuestions.value = box.read("incorrect");

    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    _animation = IntTween(
        begin: 0,end: correctQuestions
    ).animate(_animationController)..addListener(() {
      correctPercentage.value = _animation.value;
    });
    _animationController.forward();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
  }

}