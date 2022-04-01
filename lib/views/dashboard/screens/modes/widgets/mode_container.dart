import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theorytest/views/rapidQuiz/rapid_quix.dart';

class ModeContainer extends StatelessWidget{
  final String modeName;
  final String modeSubtext;
  final AssetImage image;
  final int index;

  ModeContainer(this.modeName, this.modeSubtext, this.image,this.index);

  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: ()=>{
        Get.off(()=>rapidQuizScreen())
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.orangeAccent,
                    Colors.orangeAccent.shade400
                  ]
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 6,
                    blurRadius: 3
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          padding: EdgeInsets.all(15.r),
          child:
          Row(
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$modeName",style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 27.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2
                  )),Text("$modeSubtext",style: GoogleFonts.roboto(
                      color: Colors.grey.shade100,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2
                  )),

                ],
              ),
              ),
              Image(image: AssetImage("assets/bang.png"),height: 75,),
            ],
          )
      ),
    );
  }

}