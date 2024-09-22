import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCarousel extends StatelessWidget {
  const ShimmerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(.3),
      highlightColor: Colors.white.withOpacity(.3),
      child: CarouselSlider(
        items: [1,2,3,4,5].map((movies) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              // child: ,
            ),
          );
        }).toList(),
        options: CarouselOptions(
          aspectRatio: 2.3,
          viewportFraction: .75,
        ),
      ),
    );
  }
}


class ShimmerPlaceholder extends StatelessWidget {
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double aspectRatio;
  final double extraHeight;

  const ShimmerPlaceholder({
    super.key,
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
    this.aspectRatio = 2.3 / 2,
    this.extraHeight = 50,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidthPerItem =
        (screenWidth - (3 - 1) * crossAxisSpacing) / 3;
    final mainAxisExtent = availableWidthPerItem * aspectRatio + extraHeight;

    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(.3),
      highlightColor: Colors.white.withOpacity(.3),
      child: GridView.builder(
        itemCount: 6,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: availableWidthPerItem * aspectRatio,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 20,
                width: double.infinity,
                color: Colors.grey,
              ),
              const SizedBox(height: 5),
              Container(
                height: 20,
                width: 40,
                color: Colors.grey,
              ),
            ],
          );
        },
      ),
    );
  }
}
