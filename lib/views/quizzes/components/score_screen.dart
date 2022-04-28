import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:theorytest/controllers/score_controller.dart';
import 'package:theorytest/views/quizzes/components/custom_clipper.dart';

import '../../../models/question.dart';
import '../../dashboard/dashboard.dart';


class ScoreScreen extends StatelessWidget{
  final int result;
  final List<Question> questions;
  ScoreScreen({required this.result,required this.questions});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery
                .of(context)
                .size
                .width,
            maxHeight: MediaQuery
                .of(context)
                .size
                .height),
        designSize: Size(390, 844),
        context: context,
        minTextAdapt: false,
        orientation: Orientation.portrait);
    scoreController _scoreController = Get.put(scoreController(result: result));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Your Results"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:
          IconButton(onPressed: ()=>{
            Get.offAll(MyDashBoard()),
          }, icon: Icon(CupertinoIcons.clear,color: Colors.white,size: 36,)),
      ),
      body:
          Stack(

            children: [
              ClipPath(
                clipper: scoreShape(),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  height: 1.sh/3,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      gradient: _scoreController.messageBackground
                      // image: DecorationImage(
                      //     image: ExactAssetImage("assets/blurry-gradient-haikei-6.png"),fit: BoxFit.cover
                      // ),
                    )
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _scoreController.confettiController,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ],
                  blastDirection: 3.14 / 2,
                  maxBlastForce: 5,
                  particleDrag: 0.05,// set a lower max blast force
                  minBlastForce: 2, // set a lower min blast force
                  emissionFrequency: 0.05,
                  numberOfParticles: 25, // a lot of particles at once
                  gravity: 0.2,// m
                ),
              ),
              Container(
                width: 1.sw,
                child: Column(
                    children:[
                      SizedBox(height: 140,),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: _scoreController.progressSubColor.withOpacity(0.4),
                              blurRadius: 20,
                              offset: Offset(0.0,20.0)
                            )
                          ]
                        ),
                          width: 0.55.sw,
                          height: 0.55.sw,
                          child: Obx(()=> CircularPercentIndicator(
                            radius: 0.25.sw,
                            percent: (result / questions.length),
                            lineWidth: 15,
                            circularStrokeCap: CircularStrokeCap.round,
                            linearGradient: _scoreController.progressBackground,
                            backgroundColor: _scoreController.progressSubColor,
                            center:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("${((_scoreController.time.value / questions.length)* 100).round()}",
                                            style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black,fontSize: 60.sp)
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("%",
                                                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black,fontSize: 22.sp)
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Text("Correct Questions",
                                        style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey,fontSize: 12.sp)
                                    ),
                                    Text("${result}/${questions.length}",
                                        style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey,fontSize: 12.sp)
                                    ),
                                  ],
                                ),
                            animation: true,
                            animationDuration: 1000,
                          )
                          )
                      ),
                      SizedBox(height: 30,),
                      Text(_scoreController.message,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black,fontSize: 30.sp,fontWeight: FontWeight.w600)
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: 0.8.sw,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("Score Breakdown",
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.w600,)
                            ),
                            SizedBox(height: 20,),
                            Text("Rules of the Road",
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.w600,)
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text("0/40",
                                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold,)
                                ),
                                Container(
                                  width: 0.5.sw,
                                    child: LinearPercentIndicator(
                                      backgroundColor: Colors.grey.shade300,
                                      progressColor: Color.fromRGBO(230,204,2,1),
                                      lineHeight: 10,
                                      percent: 0.5,
                                      animation: true,
                                      barRadius: Radius.circular(15),
                                    ),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("Rules of the Road",
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.w600,)
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text("0/40",
                                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold,)
                                ),
                                Container(
                                  width: 0.5.sw,
                                  child: LinearPercentIndicator(
                                    backgroundColor: Colors.grey.shade300,
                                    progressColor: Color.fromRGBO(247,96,128, 1),
                                    lineHeight: 10,
                                    percent: 0.5,
                                    animation: true,
                                    barRadius: Radius.circular(15),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("Rules of the Road",
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey,fontSize: 15.sp,fontWeight: FontWeight.w600,)
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text("0/40",
                                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold,)
                                ),
                                Container(
                                  width: 0.5.sw,
                                  child: LinearPercentIndicator(
                                    backgroundColor: Colors.grey.shade300,
                                    progressColor: Color.fromRGBO(141, 200, 23, 1),
                                    lineHeight: 10,
                                    animation: true,
                                    percent: 0.5,
                                    barRadius: Radius.circular(15),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 0.75.sw,
                        child: 
                        Column(
                          children: [
                            SizedBox(height: 25,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        gradient: _scoreController.messageBackground,
                                      boxShadow: [
                                        _scoreController.messageShadow
                                      ]
                                    ),
                                    child: TextButton(onPressed: ()=>{Get.off(()=> MyDashBoard())},
                                      child: Text("Continue",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp
                                        ),),
                                    )
                                ),Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        gradient: _scoreController.messageBackground
                                    ),
                                    child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          //Icon(CupertinoIcons.arrow_counterclockwise,color: Colors.white,),
                                          TextButton(onPressed: ()=> Get.off(()=>MyDashBoard()),
                                            child: Text("Start Again?",
                                              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white,fontSize: 16.sp,),
                                            ),)
                                        ]
                                    ),
                                ),
                              ],
                            ),
                           //  SizedBox(height: 15,),
                           // Builder(
                           //    builder: (BuildContext context){
                           //      return ElevatedButton(onPressed: ()=>{
                           //        Share.share("Check out my result!")
                           //      }, child: Text("Share"));
                           //    },
                           //  ),
                          ],
                        )
                      )
                    ]),
              )
            ],
          )
      );
  }

}