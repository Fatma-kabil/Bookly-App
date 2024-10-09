import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start});

  final MainAxisAlignment mainAxisAlignment;

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
            '4.8',
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '(2390)',
            style: Styles.textStyle14.copyWith(
                color: const Color(0xff707070), fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
