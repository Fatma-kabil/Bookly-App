import 'package:bookly_app/features/home/presentation/views/widgets/books_datails_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 7, left: 30, right: 30),
              child: CustomBookDetailsAppBar(),
            ),
            BookDetailsSection(),
            Expanded(
              child: SizedBox(
                height: 50, // min height
              ),
            ),
            SimilerBooksSection(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      )
    ]);
  }
}
