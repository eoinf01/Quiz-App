import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:get/get.dart';

import 'package:theorytest/constants/constants.dart' as Constants;
import 'package:theorytest/controllers/dashboard_controller.dart';
import 'package:theorytest/models/question.dart';

import '../../../controllers/statistics_controller.dart';

class correctQuestionsWidget extends StatelessWidget {
  correctQuestionsWidget({Key? key}) : super(key: key);

  statsController controller = Get.put(statsController());
  dashboardController dashController = Get.put(dashboardController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(40, 94, 232, 1),
              Color.fromRGBO(40, 94, 232, 1).withOpacity(0.88),
            ]),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(
                    255,
                    218,
                    218,
                    218,
                  ),
                  spreadRadius: 1.w,
                  blurRadius: 8.w,
                  offset: Offset(3.0.w, 2.w)),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          child: Row(
            children: [
              Container(
                width: 0.60.sw,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dashController.username.value != "" ?"Hey ${dashController.username.value}" : "Hey Eoin",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                          color: Colors.white),
                    ),
                    Text(
                      "You’ve completed ${controller.correctQuestions.value} out of ${controller.allQuestions.length} questions. Keep going!",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 13.sp,
                          color: Color.fromRGBO(244, 244, 244, 1)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
            child: ClipPath(
          clipper: cardShape(),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(72, 117, 242, 1),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
          ),
        )),
        Positioned.fill(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Obx(
                        () => CircularPercentIndicator(
                      radius: 40.0.r,
                      animation: true,
                      animationDuration: 1000,
                      lineWidth: 12.0.w,
                      percent:
                      controller.correctQuestions.value / sample_date.length,
                      reverse: false,
                      arcType: ArcType.FULL,
                      arcBackgroundColor: Color.fromRGBO(124, 158, 253, 1),
                      center: Text(
                        "${controller.correctPercentage.value}%",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 25.0,
                            color: Colors.white),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.transparent,
                      progressColor: Color.fromRGBO(40, 94, 232, 1),
                    ),
                  ),
                ),
              ],
            )
        )
      ],
    );
  }
}

class cardShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width-55, 0)
      ..arcToPoint(Offset(size.width-55,size.height),radius: Radius.circular(2),clockwise: false)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(size.width-55, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
