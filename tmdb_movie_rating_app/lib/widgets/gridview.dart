import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tmdb_movie_rating_app/screen/home/movie_details/movie_details.dart';
import 'package:tmdb_movie_rating_app/screen/home/movie_details/series_details.dart';

import '../models/movies.dart';

class ResponsiveGridWidget extends StatelessWidget {
  final int itemCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double aspectRatio;
  final double extraHeight;
  final List<Movie> movies;

  const ResponsiveGridWidget({
    super.key,
    required this.itemCount,
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
    this.aspectRatio = 2.3 / 2,
    this.extraHeight = 30,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidthPerItem =
        (screenWidth - (3 - 1) * crossAxisSpacing) / 3;
    final mainAxisExtent = availableWidthPerItem * aspectRatio + extraHeight;

    return GridView.builder(
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: aspectRatio,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: (context, index) {
        final movie = movies[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
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
                  child: SizedBox(
                    height: availableWidthPerItem * aspectRatio,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: movie.posterPath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   right: 0,
                //   top: 0,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.grey.withOpacity(.5),
                //       borderRadius: BorderRadius.circular(100),
                //     ),
                //     child: Consumer<BookmarkProvider>(
                //       builder: (context, bookmarkProvider, child) =>  IconButton(
                //         onPressed: () {
                //           bookmarkProvider.toggleBookmark(movie);
                //         },
                //         padding: EdgeInsets.zero,
                //         icon: bookmarkProvider.isBookmarked(movie)
                //             ? const Icon(
                //                 Iconsax.heart5,
                //                 color: Colors.red,
                //               )
                //             : const Icon(Iconsax.heart),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
            const SizedBox(height: 5),
            Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey),
            ),
            // Row(
            //   children: [
            //     const Icon(Iconsax.star5, color: Colors.amber, size: 15),
            //     const SizedBox(width: 5),
            //     Text(
            //       movie.rating.toStringAsFixed(1),
            //       maxLines: 1,
            //       overflow: TextOverflow.ellipsis,
            //       style: const TextStyle(color: Colors.grey),
            //     ),
            //   ],
            // ),
          ],
        );
      },
    );
  }
}
