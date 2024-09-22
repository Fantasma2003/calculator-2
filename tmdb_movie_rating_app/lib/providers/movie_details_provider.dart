import 'package:flutter/material.dart';
import 'package:tmdb_movie_rating_app/models/cast.dart';
import 'package:tmdb_movie_rating_app/models/movies.dart';
import 'package:tmdb_movie_rating_app/models/series_details_model.dart';
import 'package:tmdb_movie_rating_app/repository/movie_repo.dart';

import '../models/movie_details_model.dart';

class MovieDetailsProvider extends ChangeNotifier {
  MovieRepository movieRepository = MovieRepository();

  Future<MovieDetailsModel> fetchMoviesDetails(int movieId) async {
    try {
      return movieRepository.getMovieDetails(movieId);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<SeriesDetailsModel> fetchSeriesDetails(int seriesId) async {
    try {
      return movieRepository.getSeriesDetails(seriesId);
    } catch(e) {
      throw Exception(e);
    }
  }

  Future<List<Cast>> fetchCastList({required int movieId, required bool isMovie}) async {
    try {
      return movieRepository.getCastList(movieId, isMovie);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Movie>> fetchRecommendedMovies({required int movieId, required bool isMovie}) async {
    try {
      return movieRepository.getMovieRecommendations(movieId, isMovie);
    } catch (e) {
      throw Exception(e);
    }
  }
}
