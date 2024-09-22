import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_rating_app/providers/movies_provider.dart';
import 'package:tmdb_movie_rating_app/screen/search/widgets/top_searched_list_view.dart';

import '../../../models/movies.dart';

class TopSearchedWidget extends StatelessWidget {
  const TopSearchedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
      builder: (context, movieProvider, child) =>  FutureBuilder(
        future: movieProvider.fetchTopSearches(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (movieProvider.topSearches.isNotEmpty) {
            return TopSearchedListView(topSearches: movieProvider.topSearches);
          } else {
            return const Center(
              child: Text('Unable to load top searches'),
            );
          }
        },
      ),
    );
  }
}
