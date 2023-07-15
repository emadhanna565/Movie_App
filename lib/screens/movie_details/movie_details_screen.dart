import 'package:flutter/material.dart';
import 'package:movie_app/api/movie_response/Results.dart';
import 'package:movie_app/shared/style/component/detail_item.dart';
import 'package:movie_app/shared/style/component/more_like_this_list.dart';
import 'package:movie_app/shared/style/component/movie_list.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = 'movie_details';

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as Results;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          '${arg.title}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailItem(arg.id ?? 0),
            SizedBox(
              height: 12,
            ),
            MoviesList(
                listItem: MoreLikeThisMovie(arg.id ?? 0),
                title: 'More Like This',
                height: 0.43),
          ],
        ),
      ),
    );
  }
}
