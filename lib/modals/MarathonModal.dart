import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../views/quizzes/marathon_quiz.dart';

class marathonModal extends StatelessWidget {
  const marathonModal({Key? key}) : super(key: key);

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
                  Text("Marathon Quiz",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold,fontSize: 20.sp),),
                  SizedBox(height: 10,),
                  SizedBox(width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("\u2022 A test consists of 40 questions.",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.normal,fontSize: 13.sp,color: Colors.grey.shade600),textAlign: TextAlign.center,),
                        SizedBox(height: 10,),
                        Text("\u2022 If you get a question wrong the quiz ends.",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.normal,fontSize: 13.sp,color: Colors.grey.shade600),textAlign: TextAlign.center,),
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
                          Get.offAll(()=> marathonQuiz());
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