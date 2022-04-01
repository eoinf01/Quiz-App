
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theorytest/models/mode_model.dart';
import 'package:theorytest/views/dashboard/screens/modes/widgets/mode_container.dart';

class modeScreen extends StatelessWidget{
  List<modeModel> models = [modeModel(Colors.white, "Rapid-Fire", "You only have 30 seconds to answer the questions!", AssetImage("assets/alarm.png")),modeModel(Colors.white, "Rapid-Fire", "You only have 30 seconds to answer the questions!", AssetImage("assets/alarm.png"))];

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
                              padding: EdgeInsets.only(left: 20,right: 20),
                            child:
                              Container(
                                height: 1.sh,
                                width: 1.sw,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text("Modes",style: GoogleFonts.roboto(
                                      fontSize: 23.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),textAlign: TextAlign.start,),
                                    SizedBox(height: 10.h,),
                                    ListView.builder(
                                      clipBehavior: Clip.none,
                                      itemCount: models.length,
                                      shrinkWrap: true,
                                      itemBuilder: (BuildContext context, int index) {
                                        return ModeContainer(models[index].name, models[index].subtext, models[index].image,index);
                                      },
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