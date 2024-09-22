import 'package:flutter/material.dart';

import '../../../../models/cast.dart';
import 'cast_list_view.dart';

class MovieCasts extends StatelessWidget {
  const MovieCasts({
    super.key,
    required this.future,
  });

  final Future<List<Cast>> future;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox.shrink();
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) return const SizedBox.shrink();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Casts',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                CastListView(castList: snapshot.data!.toList()),
              ],
            );
          } else {
            return const Center(
              child: Text('Error retrieving movie casts'),
            );
          }
        },
      ),
    );
  }
}