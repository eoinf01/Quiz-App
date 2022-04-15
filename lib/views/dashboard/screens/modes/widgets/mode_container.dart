import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:theorytest/models/mode_model.dart';

import '../../../../../controllers/dashboard_controller.dart';

class ModeContainer extends StatelessWidget{
  final modeModel model;

  ModeContainer(this.model);

  dashboardController controller = Get.put(dashboardController());
  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: ()=>{
        showCupertinoModalBottomSheet(
          expand: false,
          isDismissible: true,
          context: context,
          builder: (context) => model.widget,
        )
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 30.h),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 6,
                    blurRadius: 3
                ),
              ],
            color: Color.fromRGBO(51, 142, 255, 1),
            borderRadius: BorderRadius.all(Radius.circular(5.w))
          ),
          child:
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15.w),
                    width: 1.sw,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(51, 142, 255, 1),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(5.r),topLeft: Radius.circular(5.r))
                    ),
                    child: Row(
                      children: [

                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(image: model.image,height: 50.h,),
                                SizedBox(width: 10.w,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${model.name}",style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2
                                      )),
                                      Text("${model.subtext}",style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                      )),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.w,),
                                Icon(CupertinoIcons.forward,color: Colors.white,)
                              ],
                            ),
                          ],
                        ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 114, 255, 1),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(5.r),bottomLeft: Radius.circular(5.r),topLeft: Radius.circular(5.r),topRight: Radius.circular(5))
                    ),
                    width: 1.sw,
                    child: Row(
                      children: [
                        if(model.name == "Rapidfire")
                          Text(controller.getRapidBest > 0 ? "Best Score: ${controller.getRapidBest.toInt()}" : "You have not tried this mode yet!",style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                          )),

                        if(model.name == "Marathon")
                          Text(controller.getMarathonBest > 0 ? "Best Score: ${controller.getRapidBest.toInt()}" : "You have not tried this mode yet!",style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                          )),

                      ],
                    ),
                  )
                ],
              )
      ),
    );
  }

}