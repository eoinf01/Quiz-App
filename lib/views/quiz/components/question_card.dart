import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theorytest/controllers/question_controller.dart';
import 'package:theorytest/controllers/rapid_controller.dart';
import 'package:theorytest/models/question.dart';
import 'package:theorytest/views/quiz/components/hero_page_route.dart';
import 'package:theorytest/views/quiz/components/hint_popup.dart';


class questionCard extends StatelessWidget {
  const questionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;


  @override
  Widget build(BuildContext context) {
    rapidQuestionController _controller = Get.find<rapidQuestionController>();
    return Column(
      children: [
    Container(
      width: 0.9.sw,
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Q${question.id}. ${question.question}?",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp
              ),
            ),
          SizedBox(height: 10),
          ...List.generate(
            question.options.length,
            (index) => Option(
              question: question            ,
              index: index,
              text: question.options[index],
              press: () => _controller.checkAnswer(question, index),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 70,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child:
                    GestureDetector(
                      onTap: ()=>Navigator.of(context).push(HeroPageRoute(builder: (context){
                       return TodoPopupCard();
    })),
                      child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.lightbulb,color: Colors.purple,),
                              Text("Hint",style: GoogleFonts.lato(
                                  color: Colors.purple
                              ),)
                            ],
                          ),)
                    )
              ])
            ],
          )
    )],
      );
  }

}

class Option extends StatelessWidget{
  Option({
    Key? key,
    required this.question,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;
  final Question question;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.options[question.id].isAnswered) {
              if (index == qnController.options[question.id].correctAns) {
                return Colors.green;
              } else if (index == qnController.options[question.id].selectedAns &&
                  qnController.options[question.id].selectedAns != qnController.options[question.id].correctAns) {
                return Colors.red;
              }
            }
            return Colors.grey;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: () =>
            {
              if(!qnController.options[question.id].isAnswered){
                qnController.checkAnswer(question, index),
              }
          },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
              border: Border.all(color: getTheRightColor()),
              borderRadius: BorderRadius.circular(15),
              ),
              child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(
                        "$text",
                        style: GoogleFonts.lato(
                            color: getTheRightColor()
                        )
                    ),),

                    Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                      color:
                       getTheRightColor() == Colors.grey
                                    ? Colors.transparent
                                    : getTheRightColor(),
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: getTheRightColor()),
                              ),
                              child: getTheRightColor() == Colors.grey
                                  ? null
                                  : Icon(getTheRightIcon(), size: 16),
                          )
                    ],
                  ),
            ),
          );
        });
  }
}