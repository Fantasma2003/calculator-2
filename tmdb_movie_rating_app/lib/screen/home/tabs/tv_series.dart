import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_rating_app/providers/series_provider.dart';
import 'package:tmdb_movie_rating_app/widgets/movie_list.dart';
import 'package:tmdb_movie_rating_app/widgets/shimmer.dart';

class TvSeriesTab extends StatelessWidget {
  const TvSeriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final seriesProvider = Provider.of<SeriesProvider>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                                const Text(
                  'Crime & Drama TV Shows',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: AspectRatio(
                          aspectRatio: 2.3 / 2,
                          child: Image.asset(
                            'assets/image.jpg',
                            height: 210,
                            width: 152,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'My List',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/image.jpg',
                          height: 210,
                          width: 152,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Sci-Fi, Fantasy & Horror',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/image.jpg',
                          height: 210,
                          width: 152,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // SizedBox(height: 20),
          // FutureBuilder(
          //   future: seriesProvider.fetchClassicSeries(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const ShimmerPlaceholder();
          //     } else if (snapshot.hasError) {
          //       return Center(child: Text('Error loading series.'));
          //     } else {
          //       return Consumer<SeriesProvider>(
          //         builder: (context, seriesProvider, child) {
          //           if (seriesProvider.classicSeries.isEmpty) {
          //             return Center(
          //                 child: Text('No classic series available.'));
          //           } else {
          //             return Padding(
          //               padding: const EdgeInsets.symmetric(horizontal: 20),
          //               child: SizedBox(
          //                 height: 200,
          //                 child: MovieList(
          //                   movies: seriesProvider.classicSeries,
          //                 ),
          //               ),
          //             );
          //           }
          //         },
          //       );
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
