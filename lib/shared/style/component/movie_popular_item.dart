import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/api_manager.dart';
import 'package:movie_app/screens/movie_details/movie_details_screen.dart';
import 'package:movie_app/shared/style/component/movie_image.dart';

class MoviePopularItem extends StatelessWidget {
  const MoviePopularItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getPopularMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return Center(
              child: Icon(Icons.error),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data?.results?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                List<String>? date =
                    snapshot.data?.results?[index].releaseDate?.split('-');
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MovieDetailsScreen.routeName,
                        arguments: snapshot.data?.results?[index]);
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      child: Stack(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    'https://image.tmdb.org/t/p/original${snapshot.data?.results?[index].backdropPath}',
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, eror) => Center(
                                  child: Icon(Icons.error),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.30,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fill,
                              ),
                              ImageIcon(
                                AssetImage(
                                  'assets/images/play_button.png',
                                ),
                                color: Colors.white,
                                size: 50,
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: MovieImage(
                                      imagePath: snapshot.data?.results?[index]
                                          .posterPath ??
                                          ''),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        snapshot.data?.results?[index].title ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            date![0],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Text(
                                            '${snapshot.data?.results?[index].popularity}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                );
              });
        });
  }
}
