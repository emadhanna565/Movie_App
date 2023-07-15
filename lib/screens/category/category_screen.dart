import 'package:flutter/material.dart';
import 'package:movie_app/api/genres_response/Genres_response.dart';
import 'package:movie_app/shared/style/component/movie_genres.dart';
import 'package:movie_app/api/api_manager.dart';
import 'package:movie_app/screens/category/Genre_screen.dart';
import 'package:movie_app/api/Movie_Discover/MoviceDiscover.dart';
class CategoryScreen extends StatefulWidget {




  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(appBar: AppBar(backgroundColor: const Color(0xff282A28)),
body: Movice_genres(),
      ),
    );

  }


}



