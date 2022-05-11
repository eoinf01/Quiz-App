import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:theorytest/constants/constants.dart' as Constants;

import '../../../controllers/onboard_controller.dart';

class inputButton extends StatelessWidget {

  
  String? validateText(String text){
    if(text.isNotEmpty && text.length< 12){
      return null;
    }
    if(text.length> 12){
      return "Profile name must be less than 12 characters.";
    }
  }
  onboardController controller = Get.put(onboardController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.8.sw,
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
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
              controller: controller.textController,
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.profile_circled),
                  fillColor: Colors.white,
                  filled: true,
                  hintText:"Profile name",
                  errorText: validateText(controller.textController.text),
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
                          color: Constants.blueCard
                      )
                  )
              ),
            ),
          ],
        ),
      )
    );
  }

}