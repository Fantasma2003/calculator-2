import 'package:flutter/material.dart';
import 'package:tmdb_movie_rating_app/screen/home/movie_details/widgets/movie_details_description.dart';

import '../../../../models/movie_details_model.dart';
import 'movie_details_info_header.dart';

class MovieDetailsInfo extends StatelessWidget {
  const MovieDetailsInfo({
    super.key,
    required this.future,
  });

  final Future<MovieDetailsModel> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        } else if (snapshot.hasData) {
          final movie = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailsInfoHeader(
                backdropPath: movie.backdropPath!,
              ),
              const SizedBox(height: 20),
              MovieDetailsDescription(
                title: movie.originalTitle!,
                releaseDate: movie.releaseDate!,
                genres: movie.genres,
                overview: movie.overview!,
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('Error retrieving movie details'),
          );
        }
      },
    );
  }
}
