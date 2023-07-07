import 'package:flutter/material.dart';

class MoviesList extends StatelessWidget {
  Widget listItem;
  double height;
  String title;

  MoviesList(
      {required this.listItem, required this.title, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * height,
      color: Color(0xff282A28),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            listItem,
          ],
        ),
      ),
    );
  }
}
