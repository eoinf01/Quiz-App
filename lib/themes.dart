import 'package:flutter/material.dart';

class iOSTheme{
  static ThemeData get lightTheme { //1
    return ThemeData( //2
      primarySwatch: Colors.blue,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(debugLabel: 'whiteCupertino body2',      fontFamily: '.SF UI Text',    inherit: true, color: Colors.black, fontWeight: FontWeight.bold,   decoration: TextDecoration.none),
        bodyText2      : TextStyle(debugLabel: 'whiteCupertino body2',      fontFamily: '.SF UI Text',    inherit: true, color: Colors.black,   decoration: TextDecoration.none),
        bodyText1     : TextStyle(debugLabel: 'whiteCupertino body1',      fontFamily: '.SF UI Text',    inherit: true, color: Colors.white,   decoration: TextDecoration.none),
        caption    : TextStyle(debugLabel: 'whiteCupertino caption',    fontFamily: '.SF UI Text',    inherit: true, color: Colors.white70, decoration: TextDecoration.none),
        button     : TextStyle(debugLabel: 'whiteCupertino button',     fontFamily: '.SF UI Text',    inherit: true, color: Colors.white,   decoration: TextDecoration.none),
        overline   : TextStyle(debugLabel: 'whiteCupertino overline',   fontFamily: '.SF UI Text',    inherit: true, color: Colors.white,   decoration: TextDecoration.none),
      ),
    );
  }
}

