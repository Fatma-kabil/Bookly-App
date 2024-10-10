import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilerBooksSection extends StatelessWidget {
  const SimilerBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'You can also like',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: SimilarBooksListView(),
        ),
      ],
    );
  }
}
