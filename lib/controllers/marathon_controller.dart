import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:theorytest/controllers/quiz_controller.dart';
import 'package:theorytest/models/question.dart';
import 'package:theorytest/views/quizzes/components/score_screen.dart';

class MarathonController extends QuizController{

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

    animationController = AnimationController(vsync: this,duration: Duration(seconds: 2700));

    animation = StepTween(begin: 2700,end: 0).animate(animationController)..addListener(() {
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
    }
    else{
      endQuiz();
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
    List<double> marathon = List.from(og["marathon"]);
    marathon.removeAt(0);
    marathon.add(answeredCorrectly.value.toDouble());
    og.update("marathon", (value) => marathon);
    box.write("scores", og);

    Get.off(()=>ScoreScreen(result: answeredCorrectly.value,));
  }
}