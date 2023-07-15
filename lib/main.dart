import 'package:flutter/material.dart';
import 'package:movie_app/layout/home/home_layout.dart';
import 'package:movie_app/screens/movie_details/movie_details_screen.dart';
import 'package:movie_app/screens/splash/splash_screen.dart';
import 'package:movie_app/shared/style/theme/myTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeLayout.routeName: (_) => HomeLayout(),
        MovieDetailsScreen.routeName: (_) => MovieDetailsScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}