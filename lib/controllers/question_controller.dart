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

    animationController = AnimationController(vsync: this,duration: Duration(seconds: 2700));

    animation = StepTween(begin: 2700,end: 0).animate(animationController)..addListener(() {
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