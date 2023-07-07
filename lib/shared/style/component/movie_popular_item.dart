import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/api_manager.dart';
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
                return InkWell(
                  onTap: () {},
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/original${snapshot.data?.results?[index].backdropPath ?? ""}',
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, eror) => Center(
                              child: Icon(Icons.error),
                            ),
                            height: MediaQuery.of(context).size.height * 0.30,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                          ),
                          Center(
                            child: ImageIcon(
                              AssetImage(
                                'assets/images/play_button.png',
                              ),
                              color: Colors.white,
                              size: 60,
                            ),
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
                                      Text(
                                        '2019   PG-13  2h 7m',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
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
