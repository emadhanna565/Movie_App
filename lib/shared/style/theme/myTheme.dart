import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff121312);
  static const Color accentColor = Color(0xff282A28);
  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: primaryColor,
      textTheme: TextTheme(
        titleMedium: TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
        bodySmall: TextStyle(fontSize: 10, color: Colors.white),
        labelLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ));
}
