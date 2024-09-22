import 'package:flutter/material.dart';

class MovieDetailsInfoHeader extends StatelessWidget {
  const MovieDetailsInfoHeader({
    super.key,
    required this.backdropPath,
  });

  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .45,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://image.tmdb.org/t/p/w500$backdropPath',
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
    );
  }
}