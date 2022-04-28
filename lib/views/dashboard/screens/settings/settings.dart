import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:theorytest/controllers/settings_controller.dart';
import 'package:theorytest/constants/constants.dart' as Constants;
import 'package:theorytest/views/dashboard/screens/settings/screens/my_account.dart';
import 'package:theorytest/views/dashboard/screens/settings/widgets/profile_image.dart';
import 'package:theorytest/views/dashboard/screens/settings/widgets/setting_container.dart';

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
                  // shadowColor: Colors.grey.shade100,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    profileImage(),
                                    Obx(()=>Text(_controller.username.value != "" ? _controller.username.value : "Learner",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 22.sp,color: Colors.black),),),
                                    Text("An Eager Student",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 13.sp,color: Colors.grey),),
                                    SizedBox(height: 10,),
                                    settingsContainer(Text("My Account",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 15.sp,color: Colors.grey)), Icon(CupertinoIcons.person_alt_circle,color: Constants.primaryBlue,), true,()=>{ Get.to(myAccountScreen())}),
                                    settingsContainer(Text("Modes",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 15.sp,color: Colors.grey),), Icon(CupertinoIcons.square_grid_2x2_fill,color: Constants.primaryBlue,),true,()=>{}),
                                    settingsContainer(Text("Leave us a review",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 15.sp,color: Colors.grey)), Icon(CupertinoIcons.star_fill,color: Constants.primaryBlue,),true,()=>{}),
                                    settingsContainer(Text("Report a bug",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 15.sp,color: Colors.grey)), Icon(CupertinoIcons.antenna_radiowaves_left_right,color: Constants.primaryBlue,),false,()=>{_controller.resetStatistics()}),
                                    settingsContainer(Text("Reset Statistics",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 15.sp,color: Colors.red)), Icon(CupertinoIcons.chart_bar_alt_fill,color: Colors.red,),false,()=>{_controller.resetStatistics()}),
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