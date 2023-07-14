import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/details_response/DetailResponse.dart';
import 'package:movie_app/api/more_like_response/MoreLikeThisResponse.dart';
import 'package:movie_app/api/movie_response/PopularResponse.dart';
import 'package:movie_app/api/recommend_response/RecommendedResponse.dart';
import 'package:movie_app/api/release_response/ReleaseResponse.dart';

class ApiManager {
  //https://api.themoviedb.org/3/movie/popular?api_key=af34928141e5b3e4e11179d3649cdebb
  static const String baseUrl = 'api.themoviedb.org';
  static const String apiKey = 'af34928141e5b3e4e11179d3649cdebb';

  static Future<PopularResponse> getPopularMovie() async {
    var uri = Uri.https(baseUrl, '3/movie/popular', {'api_key': apiKey});
    var response = await http.get(uri);
    var jsonString = response.body;
    var popularResponse = PopularResponse.fromJson(jsonDecode(jsonString));
    return popularResponse;
  }

  //'https://api.themoviedb.org/3/discover/tv? \api_key=af34928141e5b3e4e11179d3649cdebb
  static Future<ReleaseResponse> getNewReleasesMovie() async {
    var uri = Uri.https(baseUrl, '3/discover/tv', {'api_key': apiKey});
    var response = await http.get(uri);
    var jsonString = response.body;
    var releaseResponse = ReleaseResponse.fromJson(jsonDecode(jsonString));
    return releaseResponse;
  }

  static Future<RecommendedResponse> recommendedMovie() async {
    var uri = Uri.https(baseUrl, '3/movie/top_rated', {'api_key': apiKey});
    var response = await http.get(uri);
    var jsonString = response.body;
    var recommendedResponse =
        RecommendedResponse.fromJson(jsonDecode(jsonString));
    return recommendedResponse;
  }

  static Future<DetailResponse> detailMovie(int movieId) async {
    var uri = Uri.https(baseUrl, '3/movie/$movieId', {
      'api_key': apiKey,
    });
    var response = await http.get(uri);
    var jsonString = response.body;
    var detailResponse = DetailResponse.fromJson(jsonDecode(jsonString));
    return detailResponse;
  }

  //'https://api.themoviedb.org/3/movie/238/similar?language=en-US&page=1'
  static Future<MoreLikeThisResponse> moreLikeThisMovie(int movieId) async {
    var uri = Uri.https(baseUrl, '/3/movie/$movieId/similar', {
      'api_key': apiKey,
    });
    var response = await http.get(uri);
    var jsonString = response.body;
    var moreLikeResponse =
        MoreLikeThisResponse.fromJson(jsonDecode(jsonString));
    return moreLikeResponse;
  }
}
