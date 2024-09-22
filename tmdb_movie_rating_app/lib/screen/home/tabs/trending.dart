import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_rating_app/providers/movies_provider.dart';
import 'package:tmdb_movie_rating_app/widgets/shimmer.dart';
import 'package:tmdb_movie_rating_app/widgets/carousel_movie_list.dart';
import 'package:tmdb_movie_rating_app/widgets/gridview.dart';

class TrendingTab extends StatelessWidget {
  const TrendingTab({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          FutureBuilder(
            future: movieProvider.fetchTrendingMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ShimmerCarousel();
              } else if (movieProvider.trendingMovies.isNotEmpty) {
                return Consumer<MoviesProvider>(
                  builder: (context, value, child) => CarouselMovieList(
                    moviesList: movieProvider.trendingMovies,
                  ),
                );
              } else {
                return const Center(child: Text('Failed to load movies.'));
              }
            },
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Top Picks',
                  style: TextStyle(
                    fontSize: 21,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20),
                FutureBuilder(
                  future: movieProvider.fetchPopularMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ShimmerPlaceholder();
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error loading series.'));
                    } else {
                      return Consumer<MoviesProvider>(
                        builder: (context, seriesProvider, child) {
                          if (movieProvider.popularMovies.isEmpty) {
                            return const Center(
                                child: Text('No classic series available.'));
                          } else {
                            return ResponsiveGridWidget(
                                itemCount: 6,
                                movies: movieProvider.popularMovies);
                          }
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Trending Movies',
                  style: TextStyle(
                    fontSize: 21,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20),
                FutureBuilder(
                  future: movieProvider.fetchTrendingMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ShimmerPlaceholder();
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error loading series.'));
                    } else {
                      return Consumer<MoviesProvider>(
                        builder: (context, seriesProvider, child) {
                          if (movieProvider.trendingMovies.isEmpty) {
                            return const Center(
                                child: Text('No classic series available.'));
                          } else {
                            return ResponsiveGridWidget(
                                itemCount: 6,
                                movies: movieProvider.trendingMovies);
                          }
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Trending Series',
                  style: TextStyle(
                    fontSize: 21,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20),
                FutureBuilder(
                  future: movieProvider.fetchTrendingSeries(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ShimmerPlaceholder();
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error loading series.'));
                    } else {
                      return Consumer<MoviesProvider>(
                        builder: (context, seriesProvider, child) {
                          if (movieProvider.trendingSeries.isEmpty) {
                            return const Center(
                                child: Text('No classic series available.'));
                          } else {
                            return ResponsiveGridWidget(
                                itemCount: 6,
                                movies: movieProvider.trendingSeries);
                          }
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
