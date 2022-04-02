import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:theorytest/modals/RapidModal.dart';

class ModeContainer extends StatelessWidget{
  final String modeName;
  final String modeSubtext;
  final AssetImage image;
  final int index;

  ModeContainer(this.modeName, this.modeSubtext, this.image,this.index);

  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: ()=>{
        showCupertinoModalBottomSheet(
          expand: false,
          isDismissible: true,
          context: context,
          builder: (context) => rapidModal(),
        )
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 6,
                    blurRadius: 3
                ),
              ],
            color: Color.fromRGBO(51, 142, 255, 1),
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child:
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    width: 1.sw,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(51, 142, 255, 1),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5))
                    ),
                    child: Row(
                      children: [

                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(image: image,height: 50,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("$modeName",style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2
                                    )),
                                    Text("$modeSubtext",style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.normal,
                                    )),
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Icon(CupertinoIcons.forward,color: Colors.white,)
                              ],
                            )),
                          ],
                        ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 114, 255, 1),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(5.r),bottomLeft: Radius.circular(5.r),topLeft: Radius.circular(5.r),topRight: Radius.circular(5))
                    ),
                    width: 1.sw,
                    child: Row(
                      children: [
                        Text("You have not tried this mode yet!",style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.normal,
                        )),
                      ],
                    ),
                  )
                ],
              )
      ),
    );
  }

}