import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theorytest/constants/constants.dart' as Constants;
import 'package:theorytest/controllers/dashboard_controller.dart';
import 'package:theorytest/models/category_model.dart';
import 'package:theorytest/views/dashboard/screens/home/components/barchart.dart';
import 'package:theorytest/views/dashboard/screens/home/components/category_widget.dart';
import 'package:theorytest/views/quiz/quiz.dart';

import 'components/snapping_list_physics.dart';



class HomeScreen extends StatefulWidget{
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{

  List<categoryModel> models = [categoryModel(Constants.orangeCard, "Rules of the Road",Constants.lightorangeCard,new Image.asset("assets/alarm.png")),categoryModel(Constants.blueCard, "Safety Rules",Constants.lightblueCard,new Image.asset("assets/law.png")),categoryModel(Color.fromRGBO(46, 204, 113,1), "Safety Rules",Color.fromRGBO(176, 247, 206, 1),new Image.asset("assets/alarm.png")),categoryModel(Constants.orangeCard, "Rules of the Road",Constants.lightorangeCard,new Image.asset("assets/law.png")),categoryModel(Constants.blueCard, "Safety Rules",Constants.lightblueCard,new Image.asset("assets/law.png")),categoryModel(Color.fromRGBO(46, 204, 113,1), "Safety Rules",Color.fromRGBO(176, 247, 206, 1),new Image.asset("assets/law.png"))];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(390, 844),
        context: context,
        minTextAdapt: false,
        orientation: Orientation.portrait);
    dashboardController controller = Get.put(dashboardController());
   return
       Stack(
         children: [
           Scaffold(
             extendBody: true,
             backgroundColor: Color.fromRGBO(253, 253, 253, 1),
             body: Container(
               width: 1.sw,
               height: 1.sh,
               child: SafeArea(
                 child:
                    SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h,),
                        Padding(padding: EdgeInsets.only(left: 30.w,right: 25.w),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Welcome back,",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.sp
                                      )
                                  ),
                                ),
                                  Obx(()=>
                                      Text(controller.username.value == "" ? "Learner" : "${controller.username.value}",
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 26.sp
                                            )
                                        ),
                                  )
                                ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(220, 220, 220, 1),
                                    spreadRadius: 2,
                                    blurRadius: 10
                                  )]
                                ),
                                child: CircleAvatar(
                                  radius: 22.0,
                                  backgroundColor: Colors.white,
                                  child: Text(controller.username.value == "" ? "L" : controller.username.value[0].toUpperCase()),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h,),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w,top: 10.h,right: 20.w),
                          child: Container(
                            padding: EdgeInsets.all(20.r),
                            decoration: BoxDecoration(
                                boxShadow: [BoxShadow(
                                    blurRadius: 6,
                                    spreadRadius: 3,
                                    offset: Offset(1.0,3.0),
                                    color: Color.fromARGB(94,137, 255, 250,)
                                )],
                                image: DecorationImage(
                                    image: new AssetImage("assets/low-poly-grid-haikei.png"),
                                  fit: BoxFit.fill

                                ),

                                borderRadius: BorderRadius.all(
                                    Radius.circular(15)
                                )
                            ),
                            child:
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Take a",style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 26.sp,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2
                                    )),Text("practice test?",style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 26.sp,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2
                                    )),
                                    SizedBox(height: 10.h,),
                                    Text("You need to get 35 questions\nor more correct to pass!",style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal,
                                    )),
                                    SizedBox(height: 10.h,),
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                            gradient: LinearGradient(
                                                colors: [Color.fromRGBO(252, 181, 68, 0.9),Color.fromRGBO(252, 181, 2, 0.9)]
                                            )
                                        ),
                                        child: Column(
                                          children: [
                                            // SizedBox(
                                            //   height: 34.h,
                                            //   child: TextButton(onPressed: ()=>{}, child: Text("Start Test",
                                            //     style: GoogleFonts.roboto(
                                            //       fontSize: 14.sp,
                                            //       color: Colors.white,
                                            //       fontWeight: FontWeight.w400,
                                            //       letterSpacing: 1
                                            //     )
                                            //   )),
                                            // )
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 30),
                                      width: 60,
                                      height:60,
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue,
                                        shape: BoxShape.circle
                                      ),
                                      child: IconButton(onPressed: ()=>{Get.off(()=> questionScreen())}, icon: Icon(Icons.play_arrow,color: Colors.white,size: 34,),splashRadius: 10,),
                                    )
                                  ],
                                ))

                              ],
                            )
                          ),
                        ),
                        //Categories
                        SizedBox(height: 15.h,),
                        Padding(
                          padding: EdgeInsets.only(left: 30.w,right: 15.w),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Categories",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23.sp
                                      )
                                  )
                              ),
                              TextButton(onPressed: (){},
                                  child: Text("View All >",style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    color: Colors.black
                                  ),))
                            ],
                          )
                        ),
                       HorizontalSnappingList(
                            listHeight: 120,
                            itemWidth: 250,
                            itemHorizontalMargin: 20,
                            itemCount: 6,
                            itemBuilder: (context, i) {
                              return categoryWidget(
                                model: models[i],
                              );
                            },
                          ),
                        //Progress
                        SizedBox(height: 5,),
                        Padding(
                          padding: EdgeInsets.only(left: 30.w,right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Statistics",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23.sp
                                      )
                                  )
                              ),
                              TextButton(onPressed: (){},
                                  child: Text("View More >",style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black
                                  ),))
                            ],
                          )
                        ),
                         SizedBox(height: 5,),
                         Padding(
                           padding: EdgeInsets.only(left: 30.w,right: 20.w),
                           child: BarChartSample1(),
                         )
                        //Navbar
                      ],
                    ),
                    ),
               )
             )

           ),
         ]);

  }
}
