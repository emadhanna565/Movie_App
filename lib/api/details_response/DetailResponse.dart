import 'BelongsToCollection.dart';
import 'Genres.dart';
import 'ProductionCompanies.dart';
import 'ProductionCountries.dart';
import 'SpokenLanguages.dart';

/// adult : false
/// backdrop_path : "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg"
/// belongs_to_collection : {"id":230,"name":"The Godfather Collection","poster_path":"/9Baumh5J9N1nJUYzNkm0xsgjpwY.jpg","backdrop_path":"/3WZTxpgscsmoUk81TuECXdFOD0R.jpg"}
/// budget : 6000000
/// genres : [{"id":18,"name":"Drama"},{"id":80,"name":"Crime"}]
/// homepage : "http://www.thegodfather.com/"
/// id : 238
/// imdb_id : "tt0068646"
/// original_language : "en"
/// original_title : "The Godfather"
/// overview : "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge."
/// popularity : 118.251
/// poster_path : "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg"
/// production_companies : [{"id":4,"logo_path":"/gz66EfNoYPqHTYI4q9UEN4CbHRc.png","name":"Paramount","origin_country":"US"},{"id":10211,"logo_path":null,"name":"Alfran Productions","origin_country":"US"}]
/// production_countries : [{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "1972-03-14"
/// revenue : 245066411
/// runtime : 175
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"},{"english_name":"Italian","iso_639_1":"it","name":"Italiano"},{"english_name":"Latin","iso_639_1":"la","name":"Latin"}]
/// status : "Released"
/// tagline : "An offer you can't refuse."
/// title : "The Godfather"
/// video : false
/// vote_average : 8.71
/// vote_count : 18200

class DetailResponse {
  DetailResponse({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  DetailResponse.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'] != null
        ? BelongsToCollection.fromJson(json['belongs_to_collection'])
        : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    if (belongsToCollection != null) {
      map['belongs_to_collection'] = belongsToCollection?.toJson();
    }
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] =
          productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] =
          productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] =
          spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}
