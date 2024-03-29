import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:theorytest/controllers/quiz_controller.dart';
import 'package:theorytest/models/question.dart';
import 'package:theorytest/views/quizzes/components/score_screen.dart';

import '../views/dashboard/dashboard.dart';

class QuestionController extends QuizController{

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
      question.isCorrect.value = true;
      // List ids = box.read("correct");
      // if(!ids.contains(question.id)){
      //   ids.add(question.id);
      //   box.write("correct", ids);
      // }
    }
    else{
      int incorrect = box.read("incorrect");
      box.write("incorrect", ++incorrect);
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
    List<double> practice = List.from(og["practice"]);
    practice.removeAt(0);
    practice.add(answeredCorrectly.value.toDouble());

    og.update("practice", (value) => practice);
    box.write("scores", og);

    box.write("questions",jsonEncode(allQuestions));
    if(quit){
      Get.offAll(()=>MyDashBoard());
    }
    else{
      Get.off(()=>ScoreScreen(result: answeredCorrectly.value,questions: questions,),transition: Transition.fade);
    }
  }
}