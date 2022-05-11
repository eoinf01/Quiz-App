import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:theorytest/controllers/dashboard_controller.dart';

import '../../../controllers/statistics_controller.dart';

class incorrectQuestionsWidget extends StatelessWidget {
  final String name;
  incorrectQuestionsWidget({Key? key, required this.name}) : super(key: key);

  statsController controller = Get.put(statsController());
  dashboardController dashController = Get.put(dashboardController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: scoreClipper(),
          child: Container(
              height: 80,
              width: 1.sw,
              //padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color.fromRGBO(239, 53, 65, 1),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 32),
                      width: 0.66.sw,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(239, 53, 65, 1),
                            Colors.red,
                          ]
                        ),
                        border: Border.all(color: Colors.red)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$name",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.sp,
                                    color: Colors.white),
                          ),
                          Text(
                            "Time taken: 30 seconds",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 90,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(254, 105, 115, 1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name == "Rapidfire" ? dashController.rapidBestScore.toInt().toString(): dashController.marathonBestScore.toInt().toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.sp,
                                    color: Colors.white),
                          ),
                          Text(
                            "Best Score",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                    color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
        ),
        Positioned(
          right: 89,
          child: Container(
            height: 80,
            width: 2,
            child: LayoutBuilder(builder: (context, constraints) {
              return Flex(
                  direction: Axis.vertical,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      (constraints.constrainHeight() / 10).floor(),
                      (index) => SizedBox(
                            width: 2,
                            height: 5,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          )));
            }),
          ),
        ),
      ],
    );
  }
}

class scoreClipper extends CustomClipper<Path> {
  double radius = 10.r;

  @override
  Path getClip(Size size) {
    Path path = new Path();
    path
      ..lineTo(0 + radius, 0)
      ..arcToPoint(Offset(0, radius), radius: Radius.circular(20))
      ..lineTo(0, 30)
      ..arcToPoint(Offset(0, 30 + (radius * 2)), radius: Radius.circular(10))
      ..lineTo(0, size.height - radius)
      ..arcToPoint(Offset(radius, size.height), radius: Radius.circular(10))
      ..lineTo((size.width - 90) - radius, size.height)
      ..arcToPoint(Offset((size.width - 90) + radius, size.height),
          radius: Radius.circular(10), clockwise: true)
      ..lineTo(size.width - radius, size.height)
      ..arcToPoint(Offset(size.width, size.height - radius),
          radius: Radius.circular(20))
      ..lineTo(size.width, size.height - 30)
      ..arcToPoint(Offset(size.width, 30), radius: Radius.circular(10))
      ..lineTo(size.width, radius)
      ..arcToPoint(Offset(size.width - radius, 0),
          radius: Radius.circular(radius))
      ..lineTo((size.width - 90) + radius, 0)
      ..arcToPoint(Offset((size.width - 90) - radius, 0),
          radius: Radius.circular(10))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
