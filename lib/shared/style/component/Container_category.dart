
import 'package:movie_app/api/genres_response/Genres_response.dart';
import 'package:flutter/material.dart';

import '../../../screens/category/Genre_screen.dart';
  Widget Container_catagery(String title,Genres genres,BuildContext context) {


    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Genre_screen(genres: genres),),);

      },
      child: Container(
        height: 100,
      width: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    ),
    );
  }

