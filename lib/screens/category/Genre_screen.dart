import 'package:flutter/material.dart';
import 'package:movie_app/api/Movie_Discover/MoviceDiscover.dart';
import 'package:movie_app/api/genres_response/Genres_response.dart';
import 'package:movie_app/shared/style/component/Discover.dart';
class Genre_screen extends StatelessWidget {



  final Genres genres;
  int? id =0;
  Genre_screen({required this.genres});
  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        title:  Text(genres.name??''),
        centerTitle: true,
        backgroundColor: const Color(0xff282A28),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),

      body: Discover(genres.id  ),



    );
  }
}


