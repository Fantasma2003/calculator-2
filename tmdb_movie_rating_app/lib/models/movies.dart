class Movie {
  final String title;
  final String posterPath;
  final String backdropPath;
  final double rating;
  final int movieId;
  final bool isSeries;

  Movie({
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.rating,
    required this.movieId,
    required this.isSeries,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? json['name'] as String,
      posterPath: json['poster_path'] != null
          ? "https://image.tmdb.org/t/p/w500${json['poster_path']}"
          : '',
      backdropPath: json['backdrop_path'] != null
          ? "https://image.tmdb.org/t/p/w500${json['backdrop_path']}"
          : '',
      rating: json['vote_average'] as double,
      movieId: json['id'] as int,
      isSeries: json.containsKey('name'), // If 'name' exists, it's a series
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Movie &&
            runtimeType == other.runtimeType &&
            title == other.title;
  }

  @override
  int get hashCode => title.hashCode;
}
