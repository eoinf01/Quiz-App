
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:theorytest/controllers/quiz_controller.dart';
import 'package:theorytest/models/question.dart';
import 'package:theorytest/views/quizzes/components/score_screen.dart';

class rapidQuestionController extends QuizController{

  late bool updateComplete = false;

  @override
  Rx<Duration> time = Duration(seconds: 15).obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    Random random = new Random();
    questions = new RxList<Question>();
    while(questions.length < 40){
      int randomIndex = random.nextInt(sample_date.length);
      if(!questions.contains(sample_date[randomIndex])){
        questions.add(sample_date[randomIndex]);
      }
    }

    animationController = AnimationController(vsync: this,duration: Duration(seconds: 15));

    animation = IntTween(begin: 15,end: 0).animate(animationController)..addListener(() {
      if(animation.value == 0){
        if(!updateComplete){
          endQuiz();
        }
      }
      time.value = Duration(seconds: animation.value);
    });

    animationController.forward();
  }

  @override
  void checkAnswer(Question question,int index){
    options[question.id].isAnswered.value = true;
    options[question.id].correctAns.value = question.answers;
    options[question.id].selectedAns.value = index;
    questionsAnswered += 1;

    if(question.answers == index){
      answeredCorrectly.value++;
      animationController.reset();
      animationController.forward();
    }
    if(questionsAnswered == 40){
      endQuiz();
    }
    else{
      nextQuestion();
    }
  }

  @override
  void endQuiz(){
    Map og = box.read("scores");
    List<double> list = new List.from(og["rapid"]);

    list.removeAt(0);
    list.add(answeredCorrectly.value.toDouble());

    og.update("rapid", (value) => list);
    box.write("scores", og);
    updateComplete = true;

    Get.off(()=>ScoreScreen(result: answeredCorrectly.value));
  }

}