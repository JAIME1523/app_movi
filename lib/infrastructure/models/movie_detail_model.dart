import 'dart:convert';

import 'package:isar/isar.dart';

part 'movie_detail_model.g.dart';

@collection
class MovieDetailModel {
  Id idIra = Isar.autoIncrement;

  final bool adult;
  final String? backdropPath;
  // final dynamic belongsToCollection;
  final int budget;
  @ignore
  final List<Genre>? genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
   String? myReview;
  final DateTime releaseDate;
  final int revenue;
  final int runtime;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDetailModel({
    this.myReview,
    required this.adult,
    required this.backdropPath,
    // required this.belongsToCollection,
    required this.budget,
    this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailModel.fromJson(String str) =>
      MovieDetailModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovieDetailModel.fromMap(Map<String, dynamic> json) =>
      MovieDetailModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"] ??
            'https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg',
        // belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"] != null
            ? 'https://image.tmdb.org/t/p/w500/${json["poster_path"]}'
            : 'https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg',

        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        // "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": List<dynamic>.from(genres!.map((x) => x.toMap())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,

        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}

class ProductionCompany {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(String str) =>
      ProductionCompany.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductionCompany.fromMap(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}

class ProductionCountry {
  final String iso31661;
  final String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(String str) =>
      ProductionCountry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductionCountry.fromMap(Map<String, dynamic> json) =>
      ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}

class SpokenLanguage {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(String str) =>
      SpokenLanguage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SpokenLanguage.fromMap(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
