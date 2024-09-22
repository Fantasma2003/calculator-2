import 'dart:async';
import 'package:flutter/material.dart';

import '../models/movies.dart';
import '../repository/movie_repo.dart';

class SearchMovieProvider with ChangeNotifier {
  final searchController = TextEditingController();
  final movieRepository = MovieRepository();
  final Map<String, List<Movie>> _searchCache = {};
  Timer? _debounce;
  static const Duration debounceDuration = Duration(milliseconds: 300);

  List<Movie> _searchResults = [];
  bool _isLoading = false;
  String _searchText = '';

  List<Movie> get searchResults => _searchResults;
  bool get isLoading => _isLoading;
  bool get isValid => _searchText.isNotEmpty;

  void setSearchText(String text) {
    _searchText = text;

    // Cancel the previous timer if it exists
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    // Start a new timer
    _debounce = Timer(debounceDuration, () {
      _fetchSearchMovies(_searchText);
    });
  }

  Future<void> _fetchSearchMovies(String searchText) async {
    if (_searchCache.containsKey(searchText)) {
      _searchResults = _searchCache[searchText]!;
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      _searchResults = await movieRepository.getSearchedMovies(searchText);
      _searchCache[searchText] = _searchResults;
    } catch (e) {
      // Handle the error (optional: log or notify the user)
      _searchResults = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

}
