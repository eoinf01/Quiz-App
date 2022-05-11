import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theorytest/views/statistics/components/barchart.dart';
import 'package:theorytest/views/statistics/components/correct_widget.dart';

import 'components/incorrect_widget.dart';

class statsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Statistics",
              style: GoogleFonts.roboto(
                fontSize: 23.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () => {Get.back()},
              icon: Icon(
                CupertinoIcons.arrow_left,
              ),
              iconSize: 25,
              splashRadius: 20.0),
          foregroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body:
        Container(
              width: 1.sw,
              height: 1.sh,
              decoration: BoxDecoration(color: Colors.white),
              child: SafeArea(
                  child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: SingleChildScrollView(
                        clipBehavior: Clip.none,
                        child: Container(
                          height: 1.sh,
                          width: 1.sw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 1.sw,
                                child: correctQuestionsWidget(),
                              ),
                              SizedBox(height: 15,),
                              Text("HIGH SCORES",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp)),
                              SizedBox(height: 15,),
                              incorrectQuestionsWidget(name: "Rapidfire"),
                              SizedBox(height: 10,),
                              incorrectQuestionsWidget(name: "Marathon"),
                              SizedBox(height: 10,),
                              incorrectQuestionsWidget(name: "Favourites"),
                              SizedBox(height: 15,),
                              Text("PROGRESSION",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp)),
                              SizedBox(height: 10,),
                              BarChartSample1(),
                              SizedBox(
                                height: 15.h,
                              ),
                            ],
                          ),
                        ),
                      )))),
        );
  }
}

class scoreClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path
      ..lineTo(size.width, 0)
      ..lineTo(size.width - 75, 0)
      ..lineTo(size.width - 75, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
