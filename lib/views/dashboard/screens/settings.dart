import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theorytest/controllers/settings_controller.dart';

class Settings extends StatelessWidget{
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
    settingController _controller = Get.put(settingController());
    return
      Stack(
          children: [
            Scaffold(
                extendBody: true,
                backgroundColor: Color.fromRGBO(253, 253, 253, 1),
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: Text("Settings",style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold,fontSize: 23.sp)),
                ),
                body: Container(
                    width: 1.sw,
                    height: 1.sh,
                    child:
                    SafeArea(
                        child:
                        SingleChildScrollView(
                            child:
                            Padding(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10.h,),
                                  Container(
                                    width: 1.sw,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade300,
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: Offset(1,1)
                                        )
                                      ],
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Form(
                                      key: _controller.formKey,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Display Name",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 15.sp)),
                                          SizedBox(height: 15,),
                                          TextFormField(
                                            validator: (value){
                                              if(value == null || value.isEmpty){
                                                return "Display name cannot be empty!";
                                              }
                                              if(value.length > 12){
                                                return "Display name cannot be longer than 12 characters!";
                                              }
                                              if(value.indexOf(' ') > 0){
                                                return "Display name cannot contain any spaces!";
                                              }
                                              return null;
                                            },
                                            controller: _controller.displayTextController,
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(CupertinoIcons.profile_circled),
                                              fillColor: Colors.white,
                                              filled: true,
                                              hintText:"Enter name..",
                                              errorText: _controller.validateText(_controller.displayTextController.text),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey,
                                                      width: 2.5
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      width: 2.5,
                                                      color: Colors.blue
                                                  )
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15,),

                                  Container(
                                    width: 1.sw,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade300,
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: Offset(3,3)
                                          )
                                        ],
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Modes",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 15.sp)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  Container(
                                    width: 1.sw,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade300,
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: Offset(3,3)
                                          )
                                        ],
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Statistics",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 15.sp)),

                                      ],
                                    ),
                                  ),
                                SizedBox(height: 20,),
                                  TextButton(
                                    onPressed: () {  Get.snackbar("Statistics reset!", "Your test statistics have been reset.",
                                      snackPosition: SnackPosition.BOTTOM
                                    );},
                                    child: Text("Reset Statistics",style: GoogleFonts.lato(
                                      color: Colors.red,

                                    ),),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 1.sw,
                                    alignment: Alignment.center,
                                    child:
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color.fromRGBO(0, 114, 255, 1),
                                          shape: StadiumBorder(),
                                        minimumSize: Size(1.sw,40)
                                      ), onPressed: () {
                                        _controller.updateSettings();
                                        Get.snackbar("Success", "Your settings have been updated successfully",
                                        snackPosition: SnackPosition.BOTTOM
                                    );},
                                      child: Text("Save",style: GoogleFonts.lato(
                                          color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp
                                      ),),
                                    ),
                                  )
                                ],
                              ),
                              padding: EdgeInsets.only(left: 15,right: 15),
                            )
                        )
                    )
                )
            )
          ] );
  }

}