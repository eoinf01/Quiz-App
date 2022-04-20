import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/question.dart';

abstract class QuizController extends GetxController with GetSingleTickerProviderStateMixin {
  final RxInt questionID = 1.obs;
  final RxBool isSelected = false.obs;
  late RxInt questionsAnswered = 0.obs;
  late RxInt answeredCorrectly = 0.obs;
  late RxList<Question> questions;
  List<Option> options = List.generate(41, (index) => Option(false.obs, 0.obs, 0.obs));
  final int questions_length = 40;

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
    print(questions_length);
    if (questionID != questions_length) {
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
    if(questions[questionID.value-1].isLiked == false){

      questions[questionID.value-1].isLiked.value = true;
      List<dynamic> og = box.read("fav");
      og.add(questions[questionID.value-1].id);
      box.write("fav", og);
    }
    else{
      questions[questionID.value-1].isLiked.value = false;
      List<dynamic> og = box.read("fav");
      og.removeWhere((element) => element == questions[questionID.value-1].id);
      box.write("favourite", og);
    }
  }
  void endQuiz();

}