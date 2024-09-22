import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_rating_app/providers/movie_details_provider.dart';
import 'package:tmdb_movie_rating_app/providers/movies_provider.dart';
import 'package:tmdb_movie_rating_app/providers/nav_bar_provider.dart';
import 'package:tmdb_movie_rating_app/providers/search_movie_provider.dart';
import 'package:tmdb_movie_rating_app/providers/series_provider.dart';
import 'package:tmdb_movie_rating_app/repository/movie_repo.dart';

import 'core/bottom_app_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // Hive.registerAdapter(MovieAdapter());
  // await Hive.openBox<Movie>('bookmarkedMovies');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MoviesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchMovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SeriesProvider(),
        )
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF23272E),
      ),
      home: const AppBottomNavBar(),
    );
  }
}
