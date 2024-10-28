import 'package:bookly_app/conatants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SimnilarListviewShimmer extends StatelessWidget {
  const SimnilarListviewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .15,
        child: ListView.builder(
            itemCount: 5, // Number of placeholders
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Shimmer.fromColors(
                  baseColor: kshimmercolor!,
                  highlightColor: Colors.grey[400]!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 2.6 / 4,
                      child: Container(
                        color: kshimmercolor, // Placeholder color for image
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
