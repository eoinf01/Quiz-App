import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:theorytest/models/category_model.dart';

class categoryWidget extends StatelessWidget{

  final categoryModel model;



  categoryWidget({required this.model});
  @override
  Widget build(BuildContext context) {
    return
    Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 200,
          height: 120,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
          decoration: BoxDecoration(
              color: model.color,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [BoxShadow(
                  blurRadius: 4.w,
                  spreadRadius: 3.w,
                  color: Color.fromARGB(255,218, 218, 218,)
              )]
          ),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(model.name,
                style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.start,),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularPercentIndicator(radius: 25.0,
                    center: Text("0/30",style: GoogleFonts.spaceGrotesk(
                        textStyle: TextStyle(
                            color: Colors.white
                        )
                    )),
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: 0.33,
                    backgroundColor: Color.fromRGBO(243, 242, 240, 1),
                    progressColor: model.lighterColor,
                  ),
                  SizedBox(width: 10.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Questions", style: GoogleFonts.spaceGrotesk(
                          textStyle: TextStyle(
                            color: Colors.white,
                          )
                      ),textAlign: TextAlign.start,maxLines: 2,),
                      Text("Correct", style: GoogleFonts.spaceGrotesk(
                          textStyle: TextStyle(
                            color: Colors.white,
                          )
                      ),)
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(child: model.image,
            height: 55,
            right: -9,
        top: -18,),
      ],
    );
  }

}