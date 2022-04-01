import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoPopupCard extends StatelessWidget {
  const TodoPopupCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: 1,
          createRectTween: (begin, end) {
            return Tween(begin: begin, end: end);
          },
          child: Material(
            elevation: 2,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32))
                      ),
                      height: 0.045.sh,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Hint",style: GoogleFonts.lato(
                            fontSize: 19.sp

                          ),)
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextButton(
                      onPressed: () {Navigator.of(context).pop();},
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}