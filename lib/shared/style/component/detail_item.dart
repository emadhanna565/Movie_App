import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/api_manager.dart';
import 'package:movie_app/api/details_response/DetailResponse.dart';
import 'package:movie_app/shared/style/component/movie_image.dart';

class DetailItem extends StatelessWidget {
  int idMovie;

  DetailItem(this.idMovie);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DetailResponse>(
      future: ApiManager.detailMovie(idMovie),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Icon(
              Icons.error,
              color: Colors.white,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<String>? date = snapshot.data?.releaseDate?.split('-');
        return Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/original${snapshot.data?.backdropPath}',
                  placeholder: (context, url) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Center(
                      child: Icon(Icons.error),
                    );
                  },
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                ImageIcon(
                  AssetImage('assets/images/play_button.png'),
                  color: Colors.white,
                  size: 50,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snapshot.data?.title ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        '${date?[0]}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '${snapshot.data?.popularity}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        child: MovieImage(
                            imagePath: '${snapshot.data?.posterPath}'),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12, top: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.56,
                              child: Expanded(
                                child: ListView.builder(
                                  itemCount: snapshot.data?.genres?.length ?? 0,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 2, color: Colors.white),
                                      ),
                                      child: Center(
                                        child: Text(
                                          snapshot.data?.genres?[index].name ??
                                              '',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                snapshot.data?.overview ?? '',
                                softWrap: true,
                                maxLines: 5,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${snapshot.data?.voteAverage}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
