import 'package:confetti/confetti.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:theorytest/constants/constants.dart' as Constants;

import '../models/question.dart';

class scoreController extends GetxController with GetSingleTickerProviderStateMixin{

  final int result;
  final RxInt time = 0.obs;
  final List<Question> questions;
  scoreController({required this.result,required this.questions});
  late AnimationController _animationController;
  late Animation<int> _animation;
  late ConfettiController confettiController;
  AnimationController get getAnimationController => this._animationController;
  Animation get getAnimation => this._animation;
  late LinearGradient background;
  late String message;
  late String subMessage;
  late LinearGradient messageBackground;
  late LinearGradient progressBackground;
  late BoxShadow messageShadow;
  late Color progressSubColor;

  @override
  void onInit() {
    super.onInit();
    confettiController = ConfettiController(
        duration: Duration(
            seconds: 4
        )
    )..play();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 1))..forward();
    _animation = IntTween(
      begin: 0,end: result
    ).animate(_animationController)..addListener(() {
      time.value = _animation.value;
    });
    if(result/questions.length < 0.875){
      background = LinearGradient(colors: [Color.fromARGB(253, 75, 47,255),
        Color.fromARGB(255,46,159,255,),]);
      message = "Unlucky!☹️";
      subMessage = "Don't worry you need to fail to succeed!";
      messageBackground = LinearGradient(colors: [
        Constants.primaryBlue,
        Constants.primaryBlue,
      ]);
      progressBackground = LinearGradient(colors: [Constants.darkBlue,Constants.primaryBlue]);
      messageShadow = BoxShadow(
          color: Constants.blueCard,
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(1.0,1.0)
      );
      progressSubColor = Constants.lightblueCard;
    }
    else{
      message = "You passed! 🎉";
      subMessage = "Keep up the good work! You're one step closer to passing your test!";
      background = LinearGradient(colors: [Color.fromRGBO(130,244, 177,1),
        Color.fromRGBO(49, 198, 124,1)]);
      messageBackground = LinearGradient(
          colors: [
            Color.fromRGBO(22, 171, 96, 1,),
            Color.fromRGBO(22, 171, 96, 1,),
          ]
      );
      progressBackground = LinearGradient(
          colors: [
            Color.fromRGBO(22, 171, 96, 1,),
            Color.fromRGBO(16, 133, 74, 1,),
          ]
      );
      progressSubColor = Color.fromRGBO(49, 198, 124,1);
      messageShadow = BoxShadow(
          color: Color.fromRGBO(27, 179, 102, 1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(1.0,1.0)
      );
    }
    _animationController.forward();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    confettiController.dispose();
  }

}