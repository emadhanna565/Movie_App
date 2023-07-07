import 'package:flutter/material.dart';
import 'package:movie_app/api/api_manager.dart';

import '../../api/Movie_Discover/MoviceDiscover.dart';

class ListSearch extends StatelessWidget {
  dynamic query;
  ListSearch(this.query);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getsearch(query: query),
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
                      onPressed: () {}, child: const Text('Try Again'))
                ],
              ),
            );
          }
          var ListPost = snapshot.data?.results ?? [];
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: ListPost.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    height: 100,
                    width: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/original${ListPost[index].posterPath}'),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      width: 200,
                      height: 50,
                      child: Row(
                        children: [
                          Text(
                            ListPost[index].title ?? '',
                            style:
                                const TextStyle(fontSize: 12, color: Colors.white),
                          ),const SizedBox(height:15,),Text(
                            ListPost[index].releaseDate ?? '',
                            style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                          ),const SizedBox(height:15,),Text(
                            ListPost[index].overview?? '',
                            style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      )),
                ],
              );
            },
          );
        });
  }
}
