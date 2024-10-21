import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_datails_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 7, left: 30, right: 30),
              child: CustomBookDetailsAppBar(),
            ),
            BookDetailsSection(
              book: book,
            ),
            const Expanded(
              child: SizedBox(
                height: 50, // min height
              ),
            ),
            const SimilerBooksSection(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      )
    ]);
  }
}
