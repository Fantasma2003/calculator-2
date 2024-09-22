import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/movies.dart';
import '../screen/home/movie_details/movie_details.dart';

class CarouselMovieList extends StatelessWidget {
  const CarouselMovieList({
    super.key,
    required this.moviesList,
  });

  final List<Movie> moviesList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: moviesList.map((movie) {
        return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MovieDetails(movieId: movie.movieId),
                    ));
                  },
                  child: CachedNetworkImage(
                    key: ValueKey(movie.movieId),
                    height: double.infinity,
                    imageUrl: movie.backdropPath,
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 10,
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        aspectRatio: 2.3,
        autoPlay: true,
        viewportFraction: .75,
      ),
    );
  }
}
