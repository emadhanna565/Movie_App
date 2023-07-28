import 'package:flutter/material.dart';
import 'package:movie_app/api/api_manager.dart';
import 'package:movie_app/api/genres_response/Genres_response.dart';
import 'package:movie_app/shared/style/component/Container_category.dart';

class Movice_genres extends StatelessWidget {

  Genres? genres;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getGenres(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                const Text('something went wrong'),
                ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
              ],
            ),
          );
        }
        var response = snapshot.data;
        var listGenres = response?.genres ?? [];
        return Column(
          children: [
            const Text(
              'Browse category',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: listGenres.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30),
                itemBuilder: (context, index) {
                  return Container_catagery(
                      listGenres[index].name ?? '', listGenres[index], context);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}




