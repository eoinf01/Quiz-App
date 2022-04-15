import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:theorytest/controllers/score_controller.dart';

import '../../dashboard/dashboard.dart';


class ScoreScreen extends StatelessWidget{
  final int result;

  ScoreScreen({required this.result});
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
      backgroundColor: Colors.transparent,
      body:
          Stack(
            children: [
              Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(253,252,255,1),
                      image: DecorationImage(
                          image: ExactAssetImage("assets/blurry-gradient-haikei-6.png"),fit: BoxFit.cover
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
              Column(
                children: [
                  SizedBox(height: 35,),
                  Row(
                    children: [
                      IconButton(onPressed: ()=>{
                        Get.off(MyDashBoard()),
                        Get.delete<scoreController>()
                      }, icon: Icon(CupertinoIcons.clear,color: Colors.white,size: 36,)),
                    ],
                  )
                ],
              ),
              Container(
                width: 1.sw,
                child: Column(
                    children:[
                      SizedBox(height: 175,),
                      Container(
                          width: 0.4.sw,
                          height: 0.4.sw,
                          child: Obx(()=> CircularPercentIndicator(
                            radius: 0.2.sw,
                            percent: (result / 40),
                            lineWidth: 10,
                            circularStrokeCap: CircularStrokeCap.round,
                            linearGradient: LinearGradient(
                                colors: [
                                  Colors.orange,Colors.orangeAccent
                                ]
                            ),
                            backgroundColor: Color.fromRGBO(253, 253, 253, 1),
                            center:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${((_scoreController.time.value / 40)* 100).round()}",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize:60.sp,
                                      color: Colors.white
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("%",
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.normal,
                                        fontSize:20.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            animation: true,
                            animationDuration: 1000,
                          )
                          )
                      ),
                      SizedBox(height: 30,),
                      Text("Congrats! 🎉",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25.sp
                      ),),
                      SizedBox(height: 10,),
                      Container(
                        width: 0.75.sw,
                        child: 
                        Column(
                          children: [
                            Text("Keep up the good work! You're one step closer to passing your test!",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: 16.sp
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 25,),
                            Container(
                              width: 0.33.sw,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(254,214,139, 1),
                                    Color.fromRGBO(254,179,30,1),
                                  ]
                                )
                              ),
                              child: TextButton(onPressed: ()=>{},
                                child: Text("Continue",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp
                                ),),
                              )
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.arrow_counterclockwise,color: Colors.white,),
                                TextButton(onPressed: ()=> Get.off(()=>MyDashBoard()),
                                  child: Text("Start Again?",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.white,
                                        letterSpacing: 0.5
                                    ),),)
                              ]
                            ),
                           Builder(
                              builder: (BuildContext context){
                                return ElevatedButton(onPressed: ()=>{
                                  Share.share("Check out my result!")
                                }, child: Text("Share"));
                              },
                            ),
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