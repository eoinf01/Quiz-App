import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:theorytest/controllers/quiz_controller.dart';
import 'package:theorytest/models/question.dart';
import 'package:theorytest/views/quizzes/components/score_screen.dart';

import '../views/dashboard/dashboard.dart';

class favouritesController extends QuizController{

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    allQuestions = [];
    jsonDecode(box.read("questions")).forEach((element)=>{
      allQuestions.add(Question.fromJson(element))
    });
    questions = new RxList();
    allQuestions.forEach((item)=>{
      if(item.isLiked.value){
        questions.add(item)
      }
    });
    options = List.generate(questions.length+1, (index) => Option(false.obs, 0.obs, 0.obs));
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
    }
    else{
      int incorrect = box.read("incorrect");
      box.write("incorrect", ++incorrect);
    }
    if(questionsAnswered == questions.length){
      endQuiz(false);
    }
    else{
      nextQuestion();
    }
  }

  @override
  void endQuiz(bool quit){
    Map og = box.read("scores");
    List<double> favs = List.from(og["favourites"]);
    favs.removeAt(0);
    favs.add(answeredCorrectly.value.toDouble());

    og.update("favourites", (value) => favs);
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