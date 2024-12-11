import 'package:bookly_app/core/utils/styles.dart';

import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * .27;
    return Column(
      children: [
        Padding(
            padding:
                EdgeInsets.only(left: width, right: width, top: 7, bottom: 30),
            child: CustomBookImage(
              imageUrl: book.image ?? '',
            )),
        Text(
          book.authorName!,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 2,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.authorName!,
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BookRating(
          rating: book.rating?.round() ?? 0,
          count: book.count?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
         Padding(
          padding:const EdgeInsets.symmetric(horizontal: 30),
          child: BookAction(book: book,),
        ),
      ],
    );
  }
}
