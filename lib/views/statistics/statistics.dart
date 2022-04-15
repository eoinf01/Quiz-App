
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
            maxWidth: MediaQuery
                .of(context)
                .size
                .width,
            maxHeight: MediaQuery
                .of(context)
                .size
                .height),
        designSize: Size(360, 690),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return
      Scaffold(
          backgroundColor: Color.fromRGBO(253, 253, 253, 1),
          body: Container(
              width: 1.sw,
              height: 1.sh,
              child:
              SafeArea(
                  child:
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child:
                      Container(
                        height: 1.sh,
                        width: 1.sw,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(onPressed: ()=>{Get.back()}, icon: Icon(CupertinoIcons.arrow_left,),iconSize: 25,splashRadius: 20.0),
                                Text("Statistics", style: GoogleFonts.roboto(
                                  fontSize: 23.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ), textAlign: TextAlign.start,),
                                SizedBox(width: 50,)
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            BarChartSample1(),
                            SizedBox(height: 15.h,),
                            Container(
                                  width: 1.sw,
                                  height: 170.h,
                                  child: IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        correctQuestionsWidget(),
                                        SizedBox(width: 20,),
                                        incorrectQuestionsWidget(),
                                      ],
                                    ),
                                  )
                                )
                          ],

                        ),
                      )
                  )
              )
          )
      );
  }

}