import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff121312);
  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: primaryColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xff1A1A1A),
        selectedItemColor: Color(0xffFFBB3B),
        unselectedItemColor: Color(0xffB5B4B4),
      ));
}
