import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/question.dart';

abstract class QuizController extends GetxController with GetSingleTickerProviderStateMixin {
  final RxInt questionID = 1.obs;
  final RxBool isSelected = false.obs;
  late RxInt questionsAnswered = 0.obs;
  late RxInt answeredCorrectly = 0.obs;
  late List<Question> questions;
  late List<Option> options;
  late List allQuestions;

  final box = GetStorage();

  late PageController pageController;
  late AnimationController animationController;
  late Animation<int> animation;
  Rx<Duration> time = Duration(seconds: 2700).obs;

  Animation<int> get getAnimation =>  this.animation;

  Rx<Duration> get getMinutes => this.time;

  RxInt get getQuestionID => this.questionID;

  void onInit();
  @override
  void onClose() {
    pageController.dispose();
    animationController.dispose();
    super.onClose();
  }


  void checkAnswer(Question question,int index);

  void nextQuestion() {
    if (questionID != questions.length) {
      pageController.nextPage(
          duration: Duration(milliseconds: 250),
          curve: Curves.ease);
    }
    else{
      pageController.animateToPage(0, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
    }
  }

  void updateTheQnNum(int index) {
    questionID.value = index;
  }

  void setLikeButtonBool(){
    if(questions[questionID.value-1].isLiked.value == false){
      questions[questionID.value-1].isLiked.value = true;
    }
    else{
      questions[questionID.value-1].isLiked.value = false;
    }
  }
  void endQuiz(bool quit);

}