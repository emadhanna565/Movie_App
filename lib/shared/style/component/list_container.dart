import 'package:flutter/material.dart';

class List_Container extends StatelessWidget {

String? title;
String? releaseDate;
String? posterPath;
List_Container({required this.title,required this.releaseDate,required this.posterPath});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*.12,
          width: MediaQuery.of(context).size.width*.35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/original${posterPath}'),
                  fit: BoxFit.cover)),

        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
               title ?? '',
                style: const TextStyle(
                    fontSize: 18, color: Colors.white),textAlign:TextAlign.start ,
              ),

              const SizedBox(
                height: 10,
              ),
              Text(
               releaseDate ?? '',
                style: const TextStyle(
                    fontSize: 12, color: Colors.white),textAlign:TextAlign.start ,
              ),
              const SizedBox(
                height: 15,
              ),

            ],
          ),
        ),
      ],
    );;
  }
}
