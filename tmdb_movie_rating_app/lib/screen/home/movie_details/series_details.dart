import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_rating_app/providers/movie_details_provider.dart';
import 'package:tmdb_movie_rating_app/screen/home/movie_details/widgets/movie_cast_widget.dart';

import '../../../widgets/gridview.dart';

class SeriesDetails extends StatelessWidget {
  const SeriesDetails({super.key, required this.seriesId});

  final int seriesId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MovieDetailsProvider>(
        builder: (context, seriesProvider, child) => SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: seriesProvider.fetchSeriesDetails(seriesId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox.shrink();
                  } else if (snapshot.hasData) {
                    final movie = snapshot.data!;
                    String genreType =
                        movie.genres.map((genre) => genre.name).join(', ');
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.45,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${movie.backdropPath!}',
                              ),
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          child: SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.originalName!,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        '${movie.firstAirDate!.year}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      if (movie.lastAirDate!.year !=
                                          movie.firstAirDate!.year)
                                        Text(
                                          '- ${movie.lastAirDate!.year}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey,
                                          ),
                                        )
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      genreType,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                movie.overview!,
                                maxLines: 6,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  } else {
                    return const Center(
                      child: Text('Unable to load series details'),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              MovieCasts(
                future: seriesProvider.fetchCastList(
                  movieId: seriesId,
                  isMovie: false,
                ),
              ),
              FutureBuilder(
                future: seriesProvider.fetchSeriesDetails(seriesId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox.shrink();
                  } else if (snapshot.hasData) {
                    final currentSeason = snapshot.data!.seasons.last;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Current Season
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 200,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: currentSeason.posterPath!.isEmpty
                                      ? Image.asset(
                                          'assets/poster-placeholder.png',
                                          height: 200,
                                          width: 140,
                                          fit: BoxFit.cover,
                                        )
                                      : CachedNetworkImage(
                                          height: 200,
                                          width: 140,
                                          imageUrl:
                                              'https://image.tmdb.org/t/p/w500${currentSeason.posterPath}',
                                          fit: BoxFit.cover,
                                          filterQuality: FilterQuality.high,
                                        ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 20),
                                      Text('${currentSeason.name}'),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text(
                                            '${currentSeason.airDate!.year}',
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            '${currentSeason.episodeCount} Episodes',
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        currentSeason.overview!,
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('Unable to load current season'),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FutureBuilder(
                  future: seriesProvider.fetchRecommendedMovies(
                    movieId: seriesId,
                    isMovie: false,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox.shrink();
                    } else if (snapshot.hasData) {
                      final movieList = snapshot.data!.toList();
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
