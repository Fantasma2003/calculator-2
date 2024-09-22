import 'genre.dart';

class MovieDetailsModel {
  MovieDetailsModel({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
  });

  final String? backdropPath;
  final List<Genre> genres;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final DateTime? releaseDate;
  final int? runtime;
  final double? voteAverage;

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json){
    return MovieDetailsModel(
      backdropPath: json["backdrop_path"],
      genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
      id: json["id"],
      originalLanguage: json["original_language"],
      originalTitle: json["title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      releaseDate: DateTime.tryParse(json["release_date"] ?? ""),
      runtime: json["runtime"],
      voteAverage: json["vote_average"],
    );
  }

}