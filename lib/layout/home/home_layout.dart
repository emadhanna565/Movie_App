import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home_layout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
