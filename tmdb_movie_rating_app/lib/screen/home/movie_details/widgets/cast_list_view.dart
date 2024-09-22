import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../models/cast.dart';

class CastListView extends StatelessWidget {
  const CastListView({
    super.key,
    required this.castList,
  });

  final List<Cast> castList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: ListView.builder(
        // shrinkWrap: true,
        itemCount: castList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final cast = castList[index];
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              width: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: cast.profilePicture.isEmpty
                        ? Image.asset(
                            'assets/avatar.jpg',
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: cast.profilePicture,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    cast.originalName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(height: 1.1),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
