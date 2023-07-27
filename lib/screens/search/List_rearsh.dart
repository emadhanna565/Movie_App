import 'package:flutter/material.dart';
import 'package:movie_app/api/api_manager.dart';

import '../../api/Movie_Discover/MoviceDiscover.dart';
import '../../shared/style/component/list_container.dart';

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
              return List_Container(title:ListPost[index].title ,posterPath: ListPost[index].posterPath,releaseDate: ListPost[index].releaseDate,);
            },
          );
        });
  }
}
//{ListPost[index].posterPath
// ListPost[index].title
// ListPost[index].releaseDate