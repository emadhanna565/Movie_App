import 'package:flutter/material.dart';
import 'package:movie_app/api/api_manager.dart';
import 'package:movie_app/api/release_response/ReleaseResponse.dart';
import 'package:movie_app/shared/style/component/movie_image.dart';

class NewReleaseItem extends StatelessWidget {
  const NewReleaseItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ReleaseResponse>(
        future: ApiManager.getNewReleasesMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('emad');
            print(snapshot.error.toString());
            print('emad');
            return const Center(
              child: Icon(Icons.error),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          MovieImage(
                              imagePath:
                              snapshot.data?.results?[index].posterPath ??
                                  '')
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data?.results?.length ?? 0,
            ),
          );
        });
  }
}

