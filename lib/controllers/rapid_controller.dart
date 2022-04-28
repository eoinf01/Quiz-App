
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:theorytest/controllers/quiz_controller.dart';
import 'package:theorytest/models/question.dart';
import 'package:theorytest/views/dashboard/dashboard.dart';
import 'package:theorytest/views/quizzes/components/score_screen.dart';

class rapidQuestionController extends QuizController{

  late bool updateComplete = false;

  @override
  Rx<Duration> time = Duration(seconds: 15).obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    options =  List.generate(41, (index) => Option(false.obs, 0.obs, 0.obs));
    Random random = new Random();
    allQuestions = [];
    jsonDecode(box.read("questions")).forEach((element)=>{
      allQuestions.add(Question.fromJson(element))
    });
    questions = new RxList<Question>();
    while(questions.length < 40){
      int randomIndex = random.nextInt(allQuestions.length);
      if(!questions.contains(allQuestions[randomIndex])){
        questions.add(allQuestions[randomIndex]);
      }
    }

    animationController = AnimationController(vsync: this,duration: Duration(seconds: 15));

    animation = IntTween(begin: 15,end: 0).animate(animationController)..addListener(() {
      if(animation.value == 0){
        if(!updateComplete){
          endQuiz(false);
        }
      }
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
      animationController.reset();
      animationController.forward();
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
    List<double> list = new List.from(og["rapid"]);

    list.removeAt(0);
    list.add(answeredCorrectly.value.toDouble());

    og.update("rapid", (value) => list);
    box.write("scores", og);
    updateComplete = true;
    box.write("questions",jsonEncode(allQuestions));
    if(quit){
      Get.off(()=>MyDashBoard());
    }
    else{
      Get.off(()=>ScoreScreen(result: answeredCorrectly.value,questions: questions,));
    }
  }

}