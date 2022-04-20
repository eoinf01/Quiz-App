import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:theorytest/controllers/quiz_controller.dart';
import 'package:theorytest/models/question.dart';
import 'package:theorytest/views/quizzes/components/score_screen.dart';

class QuestionController extends QuizController{

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
      time.value = Duration(seconds: animation.value);
    });

    animationController.forward();
  }
  @override
  void checkAnswer(Question question,int index){
    options[questionID.value].isAnswered.value = true;
    options[questionID.value].correctAns.value = question.answers;
    options[questionID.value].selectedAns.value = index;
    questionsAnswered += 1;

    if(question.answers == index){
      answeredCorrectly.value++;
      sample_date[question.id].isCorrect.value = true;
    }
    else{
      int incorrect = box.read("incorrect");
      box.write("incorrect", ++incorrect);
      print("Incorrect Updated: ${incorrect}");
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
    List<double> practice = List.from(og["practice"]);
    practice.removeAt(0);
    practice.add(answeredCorrectly.value.toDouble());

    og.update("practice", (value) => practice);
    box.write("scores", og);

    Get.off(()=>ScoreScreen(result: answeredCorrectly.value,));
  }
}