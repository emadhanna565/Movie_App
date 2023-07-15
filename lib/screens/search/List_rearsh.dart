import 'package:flutter/material.dart';
import 'package:movie_app/api/api_manager.dart';

import '../../api/Movie_Discover/MoviceDiscover.dart';

class ListSearch extends StatefulWidget {
  dynamic query;
  ListSearch(this.query);

  @override
  State<ListSearch> createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getsearch(query: widget.query),
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
            separatorBuilder: (context, index) =>  const Padding(
              padding: EdgeInsets.all(20),
              child: Divider(color: Colors.white),
            ),
            itemCount: ListPost.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/original${ListPost[index].posterPath}'),
                            fit: BoxFit.cover)),

                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 200,
                            child: Text(
                              ListPost[index].title ?? '',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(height: 15,width: 200,
                        child: Text(
                          ListPost[index].releaseDate ?? '',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),textAlign:TextAlign.start ,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                    ],
                  ),
                ],
              );
            },
          );
        });
  }
}
