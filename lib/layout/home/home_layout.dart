import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/category/category_screen.dart';
import 'package:movie_app/screens/home/home_screen.dart';
import 'package:movie_app/screens/search/search_screen.dart';
import 'package:movie_app/screens/watch_list/witch_list_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home_layout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeScreen(),
    SearchScreen(),
    CategoryScreen(),
    WatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[selectedIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
          ),
          child: CurvedNavigationBar(
            color: Color(0xff1A1A1A),
            backgroundColor: Color(0xff1A1A1A),
            buttonBackgroundColor: Color(0xffB5B4B4),
            items: [
              ImageIcon(
                AssetImage('assets/images/home_image.png'),
                size: 40,
                color:
                    selectedIndex == 0 ? Color(0xffFFBB3B) : Color(0xffB5B4B4),
              ),
              ImageIcon(AssetImage('assets/images/search_image.png'),
                  size: 40,
                  color: selectedIndex == 1
                      ? Color(0xffFFBB3B)
                      : Color(0xffB5B4B4)),
              ImageIcon(AssetImage('assets/images/browse_category_image.png'),
                  size: 40,
                  color: selectedIndex == 2
                      ? Color(0xffFFBB3B)
                      : Color(0xffB5B4B4)),
              ImageIcon(
                  AssetImage(
                    'assets/images/watch_list_image.png',
                  ),
                  size: 40,
                  color: selectedIndex == 3
                      ? Color(0xffFFBB3B)
                      : Color(0xffB5B4B4))
            ],
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            index: selectedIndex,
          ),
        ));
  }
}
