import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:theorytest/controllers/dashboard_controller.dart';
import 'package:theorytest/views/quizzes/favouritesQuiz.dart';

import '../models/question.dart';

class favouritesModal extends StatelessWidget{
  favouritesModal({Key? key}) : super(key: key);
  dashboardController controler = Get.put(dashboardController());
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            bottom: false,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
              height: 200.h,
              width: 1.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Favourites Quiz",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold,fontSize: 20.sp),),
                  SizedBox(height: 10,),
                  SizedBox(width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("\u2022 This tests consists of all the questions you've favourited.",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.normal,fontSize: 13.sp,color: Colors.grey.shade600),textAlign: TextAlign.center,),
                        Text("\u2022 You have 40 minutes to finish the quiz.",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.normal,fontSize: 13.sp,color: Colors.grey.shade600),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey.shade400,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                )
                            ), onPressed: () {Navigator.of(context).pop();},
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text("Exit",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16.sp,fontWeight: FontWeight.bold)),
                            )),),

                        SizedBox(width: 30,),
                        Expanded(child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(0, 114, 255, 1),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                )
                            ), onPressed: () {
                              int favs = 0;
                              List allQuestions = jsonDecode(controler.box.read("questions"));
                              allQuestions.forEach((element) {
                                if(Question.fromJson(element).isLiked.value){
                                  favs++;
                                }
                              });
                              favs > 5 ? Get.offAll(()=> favouritesQuiz()) : {Get.snackbar("Sorry!", "You have to have more than 5 questions favourited before you can use this mode!",snackPosition: SnackPosition.BOTTOM),Navigator.of(context).pop()};
                        },
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text("Let's go!",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16.sp,fontWeight: FontWeight.bold)),
                            )),),
                      ],
                    ),
                  )
                ],
              ),
            )
        ));
  }
}