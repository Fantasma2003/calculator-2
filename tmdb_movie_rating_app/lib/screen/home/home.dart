import 'package:flutter/material.dart';
import 'package:tmdb_movie_rating_app/screen/home/tabs/trending.dart';
import 'package:tmdb_movie_rating_app/screen/home/tabs/tv_series.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Fantasma Movies'),
          bottom: const TabBar(
            dividerHeight: 0,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: Colors.white,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
            labelStyle: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
            tabs: [
              Tab(text: 'Trending'),
              Tab(text: 'TV / Series'),
              Tab(text: 'Movies'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Top Rated'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const TrendingTab(),
            const TvSeriesTab(),
            Container(color: Colors.greenAccent),
            Container(color: Colors.orange),
            Container(color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
