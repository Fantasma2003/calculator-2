import 'package:flutter/widgets.dart';
import 'package:tmdb_movie_rating_app/repository/movie_repo.dart';

import '../models/movies.dart';

class MoviesProvider extends ChangeNotifier {
  MovieRepository movieRepository = MovieRepository();

  // Movies
  List<Movie> _trendingMovies = [];
  List<Movie> _popularMovies = [];

  // bool _isLoadingTrendingMovies = false;
  // bool _isLoadingPopularMovies = false;

  List<Movie> get trendingMovies => _trendingMovies;

  List<Movie> get popularMovies => _popularMovies;

  // bool get isLoadingTrendingMovies => _isLoadingTrendingMovies;
  //
  // bool get isLoadingPopularMovies => _isLoadingPopularMovies;

  // Series
  List<Movie> _trendingSeries = [];

  // bool _isLoadingTrendingSeries = false;

  List<Movie> get trendingSeries => _trendingSeries;

  // bool get isLoadingTrendingSeries => _isLoadingTrendingSeries;

  // Top Search
  List<Movie> _topSearches = [];

  List<Movie> get topSearches => _topSearches;

  // Movies Methods
  Future<void> fetchTrendingMovies() async {
    if (_trendingMovies.isNotEmpty) return;

    try {
      _trendingMovies = await movieRepository.getMovies('trending/movie/week');
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> fetchPopularMovies() async {
    if (_popularMovies.isNotEmpty) return;

    try {
      _popularMovies = await movieRepository.getMovies('movie/popular');
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  // Series Method
  Future<void> fetchTrendingSeries() async {
    if (_trendingSeries.isNotEmpty) return;

    try {
      _trendingSeries = await movieRepository.getMovies('trending/tv/week');
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> fetchTopSearches() async {
    if (_topSearches.isNotEmpty) return;

    try {
      _topSearches = await movieRepository.getMovies('trending/all/week');
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
