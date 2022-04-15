import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarV1 extends StatelessWidget{

  NavBarV1({Key? key,required this.selectedIndex,
    required this.onItemSelected});

  final ValueChanged<int> onItemSelected;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Color.fromRGBO(220, 220, 220, 1),
          blurRadius: 20.0.r,
          spreadRadius: 5.0.r
        )],
        borderRadius: BorderRadius.only(topLeft: Radius.circular(22),topRight: Radius.circular(22)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white,
            Colors.white
          ]
        )
      ),
      child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedContainer(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: selectedIndex == 0 ? Colors.blue : Colors.white,
                          width: 3.0.w
                        )
                      )
                    ),
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Padding(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(onPressed: ()=>{
                            this.onItemSelected(0)
                          },child: Column(
                              children: [
                                SvgPicture.asset("assets/Home.svg",color: selectedIndex == 0 ? Colors.blue: Colors.grey,width: 28,height: 28,),
                                Text("Home",style: GoogleFonts.roboto(
                                  fontSize: 10.sp,
                                  color: selectedIndex == 0 ? Colors.blue : Colors.grey
                                ),)
                              ],
                              )
                          )],
                      ), padding: EdgeInsets.only(top: 2.h),
                      )
                  ),
                  AnimatedContainer(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: selectedIndex == 1 ? Colors.blue : Colors.white,
                                  width: 3.0.w
                              )
                          )
                      ),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Padding(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MaterialButton(onPressed: ()=>{this.onItemSelected(1)},
                              child: Column(
                                children: [
                                  SvgPicture.asset("assets/Category.svg",color: selectedIndex == 1 ? Colors.blue: Colors.grey,width: 28,height: 28,),
                                  Text("Modes",style: GoogleFonts.roboto(
                                  fontSize: 10.sp,
                                  color: selectedIndex == 1 ? Colors.blue : Colors.grey
                                  ),)
                                ],
                                )
                            )],
                        ), padding: EdgeInsets.only(top: 2.h),
                      )
                  ),AnimatedContainer(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: selectedIndex == 2 ? Colors.blue : Colors.white,
                                  width: 3.0.w
                              )
                          )
                      ),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Padding(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MaterialButton(onPressed: ()=>{this.onItemSelected(2)},
                                child: Column(
                                  children: [
                                    SvgPicture.asset("assets/Setting.svg",color: selectedIndex == 2 ? Colors.blue: Colors.grey,width: 28,height: 28,),
                                    Text("Setting",style: GoogleFonts.roboto(
                                        fontSize: 10.sp,
                                        color: selectedIndex == 2 ? Colors.blue : Colors.grey
                                    ),)
                                  ],
                                )
                            )
                            ],
                        ), padding: EdgeInsets.only(top: 2.h),
                      )
                  ),
                ],
              ),
            );
  }

}