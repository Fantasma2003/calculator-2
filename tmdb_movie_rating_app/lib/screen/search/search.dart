import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_rating_app/providers/movies_provider.dart';
import 'package:tmdb_movie_rating_app/providers/search_movie_provider.dart';
import 'package:tmdb_movie_rating_app/screen/search/widgets/top_search_widget.dart';
import 'package:tmdb_movie_rating_app/widgets/gridview.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Consumer<SearchMovieProvider>(
          builder: (context, searchMovieProvider, child) =>
              SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: CupertinoSearchTextField(
                    controller: searchMovieProvider.searchController,
                    padding: const EdgeInsets.all(10),
                    suffixIcon: const Icon(Icons.cancel_outlined),
                    prefixIcon: const Icon(Icons.search_rounded),
                    onChanged: (value) {
                      searchMovieProvider.setSearchText(value);
                    },
                  ),
                ),
                const SizedBox(height: 25),
                !searchMovieProvider.isValid
                    ? const TopSearchedWidget()
                    : searchMovieProvider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Search Results',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                ResponsiveGridWidget(
                                  itemCount:
                                      searchMovieProvider.searchResults.length,
                                  movies: searchMovieProvider.searchResults,
                                ),
                              ],
                            ),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
