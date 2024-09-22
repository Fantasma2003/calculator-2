import 'genre.dart';

class SeriesDetailsModel {
  SeriesDetailsModel({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genres,
    required this.id,
    required this.lastAirDate,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;
  final DateTime? firstAirDate;
  final List<Genre> genres;
  final int? id;
  final DateTime? lastAirDate;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final String? originalName;
  final String? overview;
  final String? posterPath;
  final List<Season> seasons;
  final String? status;
  final String? tagline;
  final String? type;
  final double? voteAverage;
  final int? voteCount;

  factory SeriesDetailsModel.fromJson(Map<String, dynamic> json) {
    return SeriesDetailsModel(
      backdropPath: json["backdrop_path"],
      firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
      genres: json["genres"] == null
          ? []
          : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
      id: json["id"],
      lastAirDate: DateTime.tryParse(json["last_air_date"] ?? ""),
      numberOfEpisodes: json["number_of_episodes"],
      numberOfSeasons: json["number_of_seasons"],
      originalName: json["name"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      seasons: json["seasons"] == null
          ? []
          : List<Season>.from(json["seasons"]!.map((x) => Season.fromJson(x))),
      status: json["status"],
      tagline: json["tagline"],
      type: json["type"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
    );
  }
}

class Season {
  Season({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  final DateTime? airDate;
  final int? episodeCount;
  final int? id;
  final String? name;
  final String? overview;
  final String? posterPath;
  final int? seasonNumber;
  final double? voteAverage;

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      airDate: DateTime.tryParse(json["air_date"] ?? ""),
      episodeCount: json["episode_count"],
      id: json["id"],
      name: json["name"],
      overview: json["overview"],
      posterPath: json["poster_path"] ?? '',
      seasonNumber: json["season_number"],
      voteAverage: json["vote_average"],
    );
  }
}
