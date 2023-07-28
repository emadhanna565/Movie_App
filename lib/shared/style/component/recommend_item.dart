import 'package:flutter/material.dart';
import 'package:movie_app/api/api_manager.dart';
import 'package:movie_app/api/recommend_response/RecommendedResponse.dart';
import 'package:movie_app/screens/movie_details/movie_details_screen.dart';
import 'package:movie_app/shared/style/component/movie_image.dart';

class RecommendItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RecommendedResponse>(
        future: ApiManager.recommendedMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Icon(Icons.error),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Expanded(
            child: ListView.builder(
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
                    decoration: ShapeDecoration(
                        color: Color(0xff343534),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    width: MediaQuery.of(context).size.width * .3,
                    margin: EdgeInsets.all(7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15)),
                                child: MovieImage(
                                    imagePath: snapshot
                                        .data?.results?[index].posterPath ??
                                        ''))
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              '${snapshot.data?.results?[index].voteAverage ?? ''}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          '${snapshot.data?.results?[index].title ?? ''}',
                          maxLines: 2,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                date![0],
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${snapshot.data?.results?[index].popularity ?? ''}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: snapshot.data?.results?.length,
            ),
          );
        });
  }
}
