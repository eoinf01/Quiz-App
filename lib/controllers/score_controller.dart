import 'package:confetti/confetti.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class scoreController extends GetxController with GetSingleTickerProviderStateMixin{

  final int result;
  final RxInt time = 0.obs;
  scoreController({required this.result});
  late AnimationController _animationController;
  late Animation<int> _animation;
  late ConfettiController confettiController;
  AnimationController get getAnimationController => this._animationController;
  Animation get getAnimation => this._animation;

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    _animation = IntTween(
      begin: 0,end: result
    ).animate(_animationController)..addListener(() {
      time.value = _animation.value;
    });
    _animationController.forward();
    confettiController = ConfettiController(
      duration: Duration(
        seconds: 4
      )
    );
    confettiController.play();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
  }

}