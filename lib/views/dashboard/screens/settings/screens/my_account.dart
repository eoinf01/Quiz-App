import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:theorytest/constants/constants.dart' as Constants;
import '../../../../../controllers/settings_controller.dart';

class myAccountScreen extends StatelessWidget{
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
                  centerTitle: true,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: ()=>{
                      if(_controller.formKey.currentState!.validate()){
                        _controller.updateSettings(),
                        Get.back(),
                      }
                    },
                    icon: Icon(CupertinoIcons.back,color: Colors.black,size: 25,),
                    splashRadius: 20,
                  ),
                  // shadowColor: Colors.grey.shade100,
                  title: Text("My Account",style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold,fontSize: 23.sp)),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Form(
                                    key: _controller.formKey,
                                    child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Display Name"),
                                        TextFormField(
                                          validator: (value){
                                            if(value == null || value.isEmpty){
                                              return "Profile name cannot be empty!";
                                            }
                                            if(value.length > 12){
                                              return "Profile name cannot be longer than 12 characters!";
                                            }
                                            if(value.indexOf(' ') > 0){
                                              return "Profile name cannot contain any spaces!";
                                            }
                                            return null;
                                          },
                                          controller: _controller.displayTextController,
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(CupertinoIcons.profile_circled),
                                              fillColor: Colors.white,
                                              filled: true,
                                              hintText:"Profile name",
                                              errorText: _controller.validateText(_controller.displayTextController.text),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.5
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      width: 2.5,
                                                      color: Constants.blueCard
                                                  )
                                              )
                                          ),
                                        ),
                                      ],
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