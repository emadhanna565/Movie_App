import 'package:flutter/material.dart';
import 'package:movie_app/layout/home/home_layout.dart';
import 'package:movie_app/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeLayout.routeName: (_) => HomeLayout(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}