import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  String imagePath;

  MovieImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .3,
          height: MediaQuery.of(context).size.height * 0.23,
          child: CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/original$imagePath' '',
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width * .3,
            height: MediaQuery.of(context).size.height * 0.23,
          ),
        ),
        Image.asset(
          'assets/images/bookmark.png',
          height: 36,
          width: 27,
        ),
      ],
    );
  }
}
