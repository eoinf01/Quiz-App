import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HintModal extends StatelessWidget {
  final String hintText;
  const HintModal({Key? key,required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            bottom: false,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
              height: 240,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hint",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold,fontSize: 20.sp),),
                  SizedBox(height: 10,),
                  SizedBox(width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("$hintText",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.normal,fontSize: 13.sp,color: Colors.grey.shade600),textAlign: TextAlign.center,),
                        ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(0, 114, 255, 1),
                              shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              )
                          ), onPressed: () {
                        Navigator.of(context).pop();
                      },
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text("Thank you!",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16.sp,fontWeight: FontWeight.bold)),
                          )),),
                    ],
                  )
                ],
              ),
            )
        ));
  }
}