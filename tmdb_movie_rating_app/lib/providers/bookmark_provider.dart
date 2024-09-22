// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
//
//
// import '../models/movies.dart';
//
// class BookmarkProvider extends ChangeNotifier {
//   late Box<Movie> bookmarkedMoviesBox;
//   Set<Movie> _bookmarkedMovies = {};
//
// List<Movie> get bookmarkedMovies => _bookmarkedMovies.toList();
//
//   BookmarkProvider() {
//     _init();
//   }
//
//   Future<void> _init() async {
//     await _loadBookmarks();
//   }
//
//   Future<void> _loadBookmarks() async {
//     bookmarkedMoviesBox = await Hive.openBox('bookmarkedMovies');
//     _bookmarkedMovies = bookmarkedMoviesBox.values.toSet();
//
//     notifyListeners();
//   }
//
//   void toggleBookmark(Movie movie) {
//     if (isBookmarked(movie)) {
//       _bookmarkedMovies.remove(movie);
//       bookmarkedMoviesBox.delete(movie.title);
//     } else {
//       _bookmarkedMovies.add(movie);
//       bookmarkedMoviesBox.put(movie.title, movie);
//     }
//     notifyListeners();
//   }
//
//
//   bool isBookmarked(Movie movie) => _bookmarkedMovies.contains(movie);
// }
