import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:get/get.dart';


import 'package:theorytest/constants/constants.dart' as Constants;
import 'package:theorytest/models/question.dart';

import '../../../controllers/statistics_controller.dart';

class correctQuestionsWidget extends StatelessWidget{

  correctQuestionsWidget({Key? key}) : super(key: key);

  statsController controller = Get.put(statsController());

  @override
  Widget build(BuildContext context) {

    return
      Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255,218, 218, 218,),
                  spreadRadius: 1.w,
                  blurRadius: 8.w,
                  offset: Offset(3.0.w,2.w)
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
          ),
          child: Column(
            children: [
              Container(
                  child: Obx(()=>CircularPercentIndicator(
                    radius: 60.0.r,
                    animation: true,
                    animationDuration: 1000,
                    lineWidth: 10.0.w,
                    percent: controller.correctQuestions.value/sample_date.length,
                    reverse: false,
                    arcType: ArcType.FULL,
                    arcBackgroundColor: Color.fromRGBO(231,231,231,1),
                    center: Text(
                      "${controller.correctPercentage.value}%",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Colors.transparent,
                    progressColor: Constants.primaryBlue,
                  ),),
              ),
             Container(
                child: Text("${controller.correctQuestions.value}/${sample_date.length} Questions Correct",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold,fontSize: 14),),
              )
            ],
          ),
        ),
      );
  }

}