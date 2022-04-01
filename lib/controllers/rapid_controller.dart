import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:theorytest/models/question.dart';
import 'package:theorytest/views/quiz/components/score_screen.dart';

class rapidQuestionController extends GetxController with GetSingleTickerProviderStateMixin{
  final RxInt questionID = 1.obs;
  final RxBool isSelected = false.obs;
  late RxInt questionsAnswered = 0.obs;
  late RxInt answeredCorrectly = 0.obs;
  RxList<Question> questions = sample_date;
  List<Option> options = List.generate(41, (index) => Option(false, 0, 0));
  final int questions_length = 40;

  final box = GetStorage();

  late PageController pageController;

  late AnimationController _animationController;
  late Animation<int> _animation;
  final Rx<Duration> time = Duration(seconds: 31).obs;

  Animation<int> get getAnimation =>  this._animation;

  Rx<Duration> get getMinutes => this.time;

  RxInt get getQuestionID => this.questionID;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();

    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 31));

    _animation = StepTween(begin: 31,end: 0).animate(_animationController)..addListener(() {
      if(_animation.value == 0){
        Get.off(()=> ScoreScreen(result: answeredCorrectly.value));
      }
      time.value = Duration(seconds: _animation.value);
    });

    _animationController.forward();
  }
  @override
  void onClose() {
    pageController.dispose();
    _animationController.dispose();
    super.onClose();
  }


  void checkAnswer(Question question,int index){
    options[question.id].isAnswered = true;
    options[question.id].correctAns = question.answers;
    options[question.id].selectedAns = index;
    questionsAnswered += 1;

    if(question.answers == index){
      answeredCorrectly.value++;
    }
    if(questionsAnswered == 40){
      List og = box.read("scores");
      og.removeAt(0);
      og.add(answeredCorrectly.value.toDouble());
      box.write("scores", og);
      Get.off(()=>ScoreScreen(result: answeredCorrectly.value,));
    }
    else{
      nextQuestion();
    }
  }

  void nextQuestion() {
    print(questions_length);
    if (questionID != questions_length) {
      _animationController.reset();
      _animationController.forward();
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
}