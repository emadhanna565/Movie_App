import 'package:flutter/material.dart';
import 'package:movie_app/shared/style/component/movie_list.dart';
import 'package:movie_app/shared/style/component/movie_popular_item.dart';
import 'package:movie_app/shared/style/component/new_release_item.dart';
import 'package:movie_app/shared/style/component/recommend_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(child: SizedBox()),
          Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: MoviePopularItem()),
          SizedBox(
            height: 20,
          ),
          MoviesList(
              listItem: NewReleaseItem(), title: 'New Releases', height: 0.3),
          SizedBox(
            height: 20,
          ),
          MoviesList(
              listItem: RecommendItem(), title: 'Recommended', height: 0.42),
        ],
      ),
    );
  }
}