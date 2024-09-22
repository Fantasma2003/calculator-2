import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movie_rating_app/screen/home/movie_details/movie_details.dart';
import 'package:tmdb_movie_rating_app/screen/home/movie_details/series_details.dart';

import '../../../models/movies.dart';

class TopSearchedListView extends StatelessWidget {
  final List<Movie> topSearches;

  const TopSearchedListView({super.key, required this.topSearches});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Searches',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          ListView.separated(
            itemCount: topSearches.length > 10 ? 10 : topSearches.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(bottom: 25),
            separatorBuilder: (_, __) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              final movie = topSearches[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            if (movie.isSeries) {
                              return SeriesDetails(seriesId: movie.movieId);
                            } else {
                              return MovieDetails(movieId: movie.movieId);
                            }
                          },
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: movie.posterPath,
                        height: 120,
                        width: 80,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
              // return Padding(
              //   padding: const EdgeInsets.only(bottom: 10),
              //   child: SizedBox(
              //     width: 120,
              //     child: ,
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
