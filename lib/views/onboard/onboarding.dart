import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:theorytest/controllers/onboard_controller.dart';
import 'package:theorytest/views/dashboard/dashboard.dart';
import 'package:theorytest/views/onboard/components/onboard_page.dart';

import 'components/onboard_page.dart';


extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

String hi = "".toCapitalized();

class NewOnboard extends StatefulWidget{
  NewOnboardState createState() => NewOnboardState();
}

class NewOnboardState extends State<NewOnboard> with SingleTickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(390, 844),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait
    );

    onboardController controller = Get.put(onboardController());

    return Stack(
            children: [
              Image.asset("assets/bg.png",width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.fill,),
              Scaffold(
                  backgroundColor: Colors.transparent,
                  body:
                  Stack(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 40,left: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(360)),
                                        boxShadow: [BoxShadow(
                                            spreadRadius: 1,
                                            blurRadius: 0.5,
                                            color: Colors.white
                                        )]
                                    ),
                                    child: IconButton(
                                      icon: new Icon(Icons.close), onPressed: () {
                                        controller.setPrefValue("");
                                        // Navigator.pushReplacement(
                                        //     context, MaterialPageRoute(
                                        //     builder: (builder) =>
                                        //         HomeScreen()));]

                                        Get.offAll(()=>MyDashBoard());
                                    },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(height: 20.h,),
                                  Expanded(
                                    child:
                                    Container(
                                      width: MediaQuery.of(context).size.width* 0.8,
                                      child: PageView(
                                        physics: NeverScrollableScrollPhysics(),
                                        controller: controller.imageController,
                                        children: [Image.asset("assets/test.png",),Image.asset("assets/bell.png"),Image.asset("assets/test.png"),],
                                      ),
                                    ),),

                                  ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 2,sigmaY: 2),
                                      child: Container(
                                          alignment: Alignment.bottomCenter,
                                          width: double.infinity,
                                          height: MediaQuery.of(context).size.height * 0.45,
                                          decoration: BoxDecoration(

                                              color: Colors.white.withOpacity(0.65),
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 20.w,right: 20.w),
                                                height: (MediaQuery.of(context).size.height * 0.28),
                                                width: double.infinity,
                                                child: PageView(
                                                  controller: controller.controller,
                                                  physics: NeverScrollableScrollPhysics(),
                                                  onPageChanged: (int index)=> {
                                                    controller.pageIndex.value = index,
                                                    if(index == 2){
                                                        controller.buttontext.value = "Get Started"
                                                      }
                                                  },
                                                  children: [
                                                    OnboardPage(heading: "Prepare", heading2: "Yourself", showButton: false),
                                                    OnboardPage(heading: "Get", heading2: "Notified", showButton: false),
                                                    OnboardPage(heading: "Setup", heading2: "Profile", showButton: true),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.h,),
                                              SmoothPageIndicator(controller: controller.controller, count: 3,effect: SlideEffect(
                                                  dotWidth: 7,dotHeight: 7
                                              ),),
                                              SizedBox(height: 20.h,),

                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.8,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          Color.fromARGB(255,92, 0, 230),
                                                          Color.fromARGB(255,55, 0, 138),
                                                        ]
                                                    )
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    if(controller.pageIndex == 2) {
                                                      if(controller.formKey.currentState!.validate()){
                                                        controller.setPrefValue(controller.textController.text.toString());
                                                        Future.delayed(const Duration(milliseconds: 500),(){
                                                          Get.to(()=>MyDashBoard());
                                                        });
                                                      }
                                                    }
                                                    else{
                                                      controller.controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                                                      controller.imageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                                                    }

                                                  },
                                                  child: Obx(()=>Text(controller.buttontext.value,style:
                                                  GoogleFonts.roboto(textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17.sp,
                                                      fontWeight: FontWeight.w300
                                                  ))
                                                  ),)
                                                ),
                                              )],
                                          )
                                      ),

                                    ),
                                  )
                                ],
                              ),
                            )],
                        )
                      ])
              )

            ],
          );
  }

}
