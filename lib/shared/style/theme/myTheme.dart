import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = const Color(0xff121312);
  static  Color accentColor = const Color(0xff282A28);
  static ThemeData lightTheme = ThemeData(

      primaryColor: primaryColor,
      scaffoldBackgroundColor: primaryColor,
      appBarTheme: AppBarTheme(backgroundColor: accentColor),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
        bodySmall: TextStyle(fontSize: 10, color: Colors.white),
        labelLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      )

  );
}
