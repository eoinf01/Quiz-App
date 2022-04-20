import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theorytest/constants/constants.dart' as Constants;

class inputButton extends StatefulWidget {
  late final TextEditingController myController;
  late Key validate;

  inputButton({Key? key, required this.myController,required this.validate}) : super(key: key);

  @override
  inputButtonState createState() {
    return inputButtonState();
  }
}

class inputButtonState extends State<inputButton>{


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.myController.dispose();
    super.dispose();
  }
  
  String? validateText(String text){
    if(text.isNotEmpty && text.length< 12){
      return null;
    }
    if(text.length> 12){
      return "Profile name must be less than 12 characters.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.8.sw,
      child: Form(
        key: widget.validate,
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
              controller: widget.myController,
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.profile_circled),
                  fillColor: Colors.white,
                  filled: true,
                  hintText:"Profile name",
                  errorText: validateText(widget.myController.text),
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