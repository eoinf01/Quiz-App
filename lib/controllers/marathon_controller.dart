import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:theorytest/controllers/quiz_controller.dart';
import 'package:theorytest/models/question.dart';
import 'package:theorytest/views/quizzes/components/score_screen.dart';

import '../views/dashboard/dashboard.dart';

class MarathonController extends QuizController{

  @override
  void onInit() {
    super.onInit();
    options = List.generate(41, (index) => Option(false.obs, 0.obs, 0.obs));
    pageController = PageController();
    Random random = new Random();
    allQuestions = [];
    jsonDecode(box.read("questions")).forEach((element)=>{
      allQuestions.add(Question.fromJson(element))
    });
    questions =[];
    while(questions.length < 40){
      int randomIndex = random.nextInt(allQuestions.length);
      if(!questions.contains(allQuestions[randomIndex])){
        questions.add(allQuestions[randomIndex]);
      }
    }

    animationController = AnimationController(vsync: this,duration: Duration(seconds: 2700));

    animation = StepTween(begin: 2700,end: 0).animate(animationController)..addListener(() {
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
      question.isCorrect.value = true;
      answeredCorrectly.value++;
    }
    else{
      int incorrect = box.read("incorrect");
      box.write("incorrect", ++incorrect);
      endQuiz(false);
    }
    if(questionsAnswered == 40){
      endQuiz(false);
    }
    else{
      nextQuestion();
    }
  }

  @override
  void endQuiz(bool quit){
    Map og = box.read("scores");
    List<double> marathon = List.from(og["marathon"]);
    marathon.removeAt(0);
    marathon.add(answeredCorrectly.value.toDouble());
    og.update("marathon", (value) => marathon);
    box.write("scores", og);
    box.write("questions",jsonEncode(allQuestions));
    if(quit){
      Get.offAll(()=>MyDashBoard());
    }
    else{
      Get.off(()=>ScoreScreen(result: answeredCorrectly.value,questions: questions,));
    }
  }
}