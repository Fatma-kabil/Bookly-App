import 'package:bookly_app/conatants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewestListviewShimmer  extends StatelessWidget {
  const NewestListviewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
  
  return Shimmer.fromColors(
    baseColor: kshimmercolor!,
    highlightColor: Colors.grey[100]!,
    child: ListView.builder(
      itemCount: 5,  // Mock item count for loading state
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            height: 125,
            child: Row(
              children: [
                AspectRatio(
                   aspectRatio: 2.6 / 4,
                  child: Container(
                   
                    color: Colors.grey[300], // Mock for book image
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 20,
                        color: kshimmercolor, // Mock for title
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 15,
                        color: kshimmercolor, // Mock for author
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 15,
                            color: kshimmercolor, // Mock for "Free"
                          ),
                          const Spacer(),
                          Container(
                            width: 50,
                            height: 15,
                            color:kshimmercolor // Mock for rating
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
  }
