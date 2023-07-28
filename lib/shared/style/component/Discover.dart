import 'package:flutter/material.dart';
import 'package:movie_app/api/api_manager.dart';
import 'package:movie_app/shared/style/component/movie_image.dart';

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
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
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

          var listPost = snapshot.data?.results ?? [];
          return GridView.builder(
            itemCount: listPost.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.4 / 2,
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