import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/statistics_controller.dart';

class incorrectQuestionsWidget extends StatelessWidget{

  incorrectQuestionsWidget({Key? key}) : super(key: key);

  statsController controller = Get.put(statsController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(

          padding: EdgeInsets.all(10.w),
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
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                // decoration: BoxDecoration(
                //     color: Colors.grey.shade200,
                //     borderRadius: BorderRadius.all(Radius.circular(20))
                // ),
                child: Obx(()=>Text(
                  '${controller.incorrectQuestions.value}',
                  style: TextStyle(fontSize: 80,color: Colors.black),
                  maxLines: 1,
                )),),
             Container(
                child: Text("Incorrect Answers",textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),maxLines: 1,),
              )
            ],
          )
      ),
    );
  }

}