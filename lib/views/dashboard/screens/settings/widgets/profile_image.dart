import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:theorytest/controllers/settings_controller.dart';

class profileImage extends StatelessWidget{
  settingController controller = Get.put(settingController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0,4)
          )
        ]
      ),
      width: 100,
      height: 100,
      child:
        CircleAvatar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          child:
          Obx(()=>
              Text(controller.username.value != "" ? controller.username.value[0]: "L",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp
                ),
              ),
          )
          )
    );
  }

}