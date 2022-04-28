import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:theorytest/views/dashboard/dashboard.dart';
import 'package:theorytest/views/quizzes/components/question_card.dart';

import '../../controllers/marathon_controller.dart';

class marathonQuiz extends StatelessWidget {
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
        designSize: Size(390, 844),
        context: context,
        minTextAdapt: false,
        orientation: Orientation.portrait);
    MarathonController _controller = Get.put(MarathonController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              splashRadius:20,
              onPressed: () =>
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text(
                              "Are you sure you want to quit this quiz?"),
                          content: Text("You will lose any progress made."),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Yes'),
                              onPressed: () {
                                Get.offAll(()=>MyDashBoard());
                              },
                            ), TextButton(
                              child: const Text('No'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      }),
              icon: Icon(
                Icons.arrow_back_ios_new_sharp, color: Colors.white,),
              iconSize: 16,),
            SizedBox(width: 65,),
            Text("Marathon Quiz",style: GoogleFonts.poppins(

            ),),
          ],
        ),
      ),
      body:
      Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(253,252,255,1)
          ),
          child: Column(
              children: [
                SizedBox(height: 25,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(()=> Text("Question ${_controller
                                .getQuestionID} of ${_controller.questions.length}",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 21.sp,
                              ),
                            ))
                          ]
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 15,
                        width: 0.9.sw,
                        child: Obx(() =>
                            LinearPercentIndicator(
                              lineHeight: 13,
                              barRadius: Radius.circular(50),
                              percent: (_controller.questionsAnswered) / _controller.questions.length,
                              linearGradient: LinearGradient(
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.lightBlue
                                  ]
                              ),
                              backgroundColor: Color.fromRGBO(245,246,251, 1),
                            ),
                        )
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                    width: 0.9.sw,
                    height: 0.62.sh,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                            color: Color.fromRGBO(238,239,248, 1),
                            spreadRadius: 12,
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal
                        )],
                        borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30),bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40))
                    ),
                    child: Column(
                        children: [
                          Expanded(
                            child: PageView.builder(
                              controller: _controller.pageController,
                              onPageChanged: (index) =>
                                  _controller.updateTheQnNum(index%40 + 1),
                              itemBuilder: (context, index) {
                                return questionCard(question: _controller.questions[index % 40],controller: Get.find<MarathonController>(),);
                              },
                            ),)
                        ])
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                              onTap: _controller.setLikeButtonBool,
                              child: Obx(()=>
                                  AnimatedContainer(duration: Duration(milliseconds: 2000),
                                    curve: Curves.easeIn,
                                    child:                             Icon(Icons.favorite,color: _controller.questions[_controller.questionID.value-1].isLiked.value ? Colors.red : Colors.grey,size: 33,),)
                                ,)
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ])
      ),
    );
  }
}