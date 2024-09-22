import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_rating_app/providers/movie_details_provider.dart';
import 'package:tmdb_movie_rating_app/screen/home/movie_details/widgets/movie_cast_widget.dart';
import 'package:tmdb_movie_rating_app/screen/home/movie_details/widgets/movie_details_info.dart';
import 'package:tmdb_movie_rating_app/widgets/gridview.dart';

class MovieDetails extends StatelessWidget {
  final int movieId;

  const MovieDetails({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MovieDetailsProvider>(
        builder: (context, movieProvider, child) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailsInfo(
                future: movieProvider.fetchMoviesDetails(movieId),
              ),
              const SizedBox(height: 20),
              MovieCasts(future: movieProvider.fetchCastList(movieId: movieId, isMovie: true)),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FutureBuilder(
                  future: movieProvider.fetchRecommendedMovies(movieId: movieId, isMovie: true),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox.shrink();
                    } else if (snapshot.hasData) {
                      final movieList = snapshot.data!.toList() ?? [];

                      print('Length of movies is ${movieList.length}');
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'For you',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ResponsiveGridWidget(
                            itemCount: movieList.length,
                            movies: movieList,
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text('Error retrieving movie recommendation'),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
