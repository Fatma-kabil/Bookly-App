import 'package:bookly_app/conatants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedListviewShimmer extends StatelessWidget {
  const FeaturedListviewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,  // Mock count for shimmer loading state
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Shimmer.fromColors(
              baseColor: kshimmercolor!,
              highlightColor: Colors.grey[400]!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: Container(
                    color: kshimmercolor, // Placeholder color
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  }
