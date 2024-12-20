import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rating,
      required this.count});

  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final num count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          const Icon(
            size: 15,
            FontAwesomeIcons.solidStar,
            color: Colors.yellow,
          ),
          const SizedBox(
            width: 6.3,
          ),
          Text(
            rating.toString(),
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '($count)',
            style: Styles.textStyle14.copyWith(
                color: const Color(0xff707070), fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
