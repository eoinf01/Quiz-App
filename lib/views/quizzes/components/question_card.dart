import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theorytest/controllers/quiz_controller.dart';
import 'package:theorytest/modals/HintModal.dart';
import 'package:theorytest/models/question.dart';

import '../../../modals/FloatingHintModal.dart';


class questionCard extends StatelessWidget {
  const questionCard({
    Key? key,
    // it means we have to pass this
    required this.question, required this.controller,
  }) : super(key: key);

  final Question question;
  final QuizController controller;


  @override
  Widget build(BuildContext context) {
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
              press: () => controller.checkAnswer(question, index),
              controller: controller,
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
                      onTap: ()=>{showFloatingModalBottomSheet(
                        context: context,
                        builder: (context) => HintModal(hintText: "Default Hint ",),
                      )},
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
    required this.press, required this.controller,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;
  final Question question;
  final QuizController controller;



  @override
  Widget build(BuildContext context) {

    Color getTheRightColor() {
      if (controller.options[question.id].isAnswered.value) {
        if (index == controller.options[question.id].correctAns.value) {
          return Colors.green;
        } else if (index == controller.options[question.id].selectedAns.value &&
            controller.options[question.id].selectedAns.value != controller.options[question.id].correctAns.value) {
          return Colors.red;
        }
      }
      return Colors.grey;
    }

    IconData getTheRightIcon() {
      return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
    }

    return Obx(()=>
        InkWell(
          onTap: () =>
          {
            if(!controller.options[question.id].isAnswered.value){
              controller.checkAnswer(question, index),
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
        ));
  }
}