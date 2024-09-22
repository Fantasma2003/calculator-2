import 'package:flutter/material.dart';
import 'package:tmdb_movie_rating_app/repository/movie_repo.dart';

import '../models/movies.dart';

class SeriesProvider extends ChangeNotifier {
  MovieRepository movieRepository = MovieRepository();

  List<Movie> _classicSeries = [];

  List<Movie> get classicSeries => _classicSeries;

  Future<void> fetchClassicSeries() async {
    if (_classicSeries.isNotEmpty) {
      return;
    }

    try {
      _classicSeries = await movieRepository.getMovies('tv/top_rated');
      notifyListeners();
    } catch(e) {
      throw Exception(e);
    }
  }
}