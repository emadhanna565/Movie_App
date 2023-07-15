import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:movie_app/layout/home/home_layout.dart';
import 'package:movie_app/screens/splash/splash_screen.dart';
import 'package:movie_app/shared/style/theme/myTheme.dart';
import 'package:movie_app/screens/category/Genre_screen.dart';

import 'local_database/modle/list_watch.dart';
const watch='watch';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<ListWatch>(watch);
  Hive.registerAdapter(ListWatchAdapter());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      routes: {

        SplashScreen.routeName: (_) => SplashScreen(),
        HomeLayout.routeName: (_) => HomeLayout(),

      },
      initialRoute: SplashScreen.routeName,
    );
  }
}