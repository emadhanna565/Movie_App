import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/api_manager.dart';
import 'package:movie_app/api/Movie_Discover/MoviceDiscover.dart';
import 'package:movie_app/shared/style/component/movie_image.dart';
import 'package:movie_app/api/genres_response/Genres_response.dart';
import 'package:movie_app/screens/category/Genre_screen.dart';

class Discover extends StatefulWidget {
 dynamic id;
  Discover(this.id);
  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {




  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getMovieDiscover(widget.id??''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Column(
              children: [
                CircularProgressIndicator(),
              ],
            );
          }
          if (snapshot.hasError) {

              print(snapshot.error.toString());

            return Center(
              child: Column(
                children: [
                  const Text('something went wrong'),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Try again'))
                ],
              ),
            );
          }

          var ListPost = snapshot.data?.results ?? [];
          return GridView.builder(
            itemCount: ListPost.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3,
              childAspectRatio: 1.4/ 2,


                ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        MovieImage(
                            imagePath:
                            snapshot.data?.results?[index].posterPath ??
                                '')
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}


