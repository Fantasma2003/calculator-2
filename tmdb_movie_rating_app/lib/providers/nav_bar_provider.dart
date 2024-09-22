import 'package:flutter/material.dart';
import 'package:tmdb_movie_rating_app/screen/home/home.dart';
import 'package:tmdb_movie_rating_app/screen/search/search.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    Container(color: Colors.blue),
  ];

  int get currentIndex => _currentIndex;
  Widget get currentPage => _pages[_currentIndex];

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}