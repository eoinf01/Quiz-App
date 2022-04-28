import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../controllers/settings_controller.dart';

class settingsContainer extends StatelessWidget{
  final Text text;
  final Icon icon;
  final bool showLastIcon;
  final void Function()? action;
  settingsContainer(this.text,this.icon,this.showLastIcon, this.action);

  settingController controller = Get.put(settingController());
  @override
  Widget build(BuildContext context) {
    return
    Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton.icon(onPressed: action,
        icon: Padding(
            padding: EdgeInsets.only(right: 8),
            child: icon
        ),
        label: Row(
          children: [
            Expanded(
              child: text),
            showLastIcon ? Icon(CupertinoIcons.forward,color: Colors.grey,) : SizedBox.shrink()
          ],
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(15)),
          alignment: Alignment.centerLeft,
          fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(1.sw)),
          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
        ),
      ),
    );
  }

}