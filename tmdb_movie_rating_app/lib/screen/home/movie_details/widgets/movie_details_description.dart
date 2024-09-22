import 'package:flutter/material.dart';

import '../../../../models/genre.dart';

class MovieDetailsDescription extends StatelessWidget {
  const MovieDetailsDescription({
    super.key,
    required this.overview,
    required this.genres,
    required this.title,
    required this.releaseDate,
  });

  final String title;
  final DateTime releaseDate;
  final List<Genre> genres;
  final String overview;

  @override
  Widget build(BuildContext context) {
    final genreText = genres.map((genre) => genre.name).join(", ");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                releaseDate.year.toString(),
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Text(
                  genreText,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            overview,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 17, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
