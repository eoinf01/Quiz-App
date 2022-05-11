import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theorytest/controllers/onboard_controller.dart';
import 'package:theorytest/views/onboard/components/textfield_widget.dart';

class OnboardPage extends StatelessWidget{
  String heading;
  String heading2;
  bool showButton;
  OnboardPage({required this.heading,required this.heading2,required this.showButton}){
    this.heading = heading;
    this.heading2 = heading2;
    this.showButton = showButton;
  }

  @override
  Widget build(BuildContext context) {
    onboardController controller = Get.put(onboardController());
    return(
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image.asset("assets/test.png"),
              Text(this.heading, style: GoogleFonts.roboto(textStyle:
                TextStyle(
                  color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 33.sp,
                            letterSpacing: 2.sp
                        )),textAlign: TextAlign.center,),
                Text(this.heading2, style: GoogleFonts.roboto(textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 33.sp,
                letterSpacing: 2
                )),
                ),
              Text("Practice all the questions you need to pass the theory test and feel confident when you take the test!",
                style: GoogleFonts.roboto(textStyle:
                TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp
                )),textAlign: TextAlign.center,),
              showButton == true ? SizedBox(height: 17.h,): SizedBox(height: 10.h,),
              if(showButton == true)
                inputButton()
            ],

          ));
  }

}