import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class scoreShape extends CustomClipper<Path>{

  @override
  getClip(Size size) {
    double radius = 40.w;
    Path path = Path()
      ..lineTo(0, size.height - size.height/2)
      ..quadraticBezierTo(20.w, (size.height+40.h), size.width-radius, size.height)
      ..arcToPoint(Offset(size.width, size.height - radius),radius: Radius.circular(40),clockwise: false)
      ..lineTo(size.width, 0)
      ..close();

    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
  
}