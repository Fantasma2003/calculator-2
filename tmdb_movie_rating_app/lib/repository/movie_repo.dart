import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmdb_movie_rating_app/models/cast.dart';
import '../models/movie_details_model.dart';
import '../models/movies.dart';
import '../models/series_details_model.dart';

class MovieRepository {
  final String apiKey = 'dd28c8ac4f90da8f48f6eaa96b241120';
  final String baseURL = 'https://api.themoviedb.org/3';

  Future<List<Movie>> getMovies(String endpoint) async {
    List<Movie> trendingMovies = [];

    final url = Uri.parse('$baseURL/$endpoint?api_key=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData['results'] is List) {
          for (final json in jsonData['results']) {
            Movie movie = Movie.fromJson(json);
            trendingMovies.add(movie);
          }
        } else {
          throw Exception('Invalid data format received');
        }
      } else {
        throw Exception(
            'Failed to load trending movies. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }

    return trendingMovies;
  }

  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final url = Uri.parse('$baseURL/movie/$movieId?api_key=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return MovieDetailsModel.fromJson(jsonData);
      } else {
        throw Exception(
            'Failed to load movie details. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Cast>> getCastList(int movieId, bool isMovies) async {
    List<Cast> castList = [];
    String endPoint =
        isMovies ? '/movie/$movieId/credits' : '/tv/$movieId/credits';

    final url = Uri.parse('$baseURL$endPoint?api_key=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['cast'] is List) {
          for (final json in jsonData['cast']) {
            final cast = Cast.fromJson(json);
            castList.add(cast);
          }
        } else {
          throw Exception('Invalid data received.');
        }
      } else {
        throw Exception(
            'Failed to load movie casts. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }

    return castList;
  }

  Future<List<Movie>> getMovieRecommendations(
    int movieId,
    bool isMovies,
  ) async {
    List<Movie> recommendedMovies = [];
    String endPoint = isMovies
        ? '/movie/$movieId/recommendations'
        : '/tv/$movieId/recommendations';
    final url = Uri.parse('$baseURL$endPoint?api_key=$apiKey');
    print('$baseURL$endPoint?api_key=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['results'] is List) {
          for (final json in jsonData['results']) {
            Movie movie = Movie.fromJson(json);
            recommendedMovies.add(movie);
          }
        } else {
          throw Exception('Invalid data received');
        }
      } else {
        throw Exception(
            'Failed to load movie recommendations. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }

    return recommendedMovies;
  }

  Future<SeriesDetailsModel> getSeriesDetails(int seriesId) async {
    final url = Uri.parse('$baseURL/tv/$seriesId?api_key=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return SeriesDetailsModel.fromJson(jsonData);
      } else {
        throw Exception(
            'Failed to load series details. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Movie>> getSearchedMovies(String query) async {
    List<Movie> searchMovies = [];
    final url = Uri.parse('$baseURL/search/multi?api_key=$apiKey&query=$query');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['results'] is List) {
          for (final json in jsonData['results']) {
            if (json['media_type'] != 'person') {
              Movie movie = Movie.fromJson(json);
              searchMovies.add(movie);
            }
          }
        } else {
          throw Exception('Invalid data received');
        }
      } else {
        throw Exception(
          'Failed to load search movies. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception(e);
    }
    return searchMovies;
  }
}
