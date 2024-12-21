import 'package:bookly_app/features/home/domain/entites/book_entity.dart';

import 'package:bookly_app/features/home/presentation/views/widgets/newest_list_view_item.dart';
import 'package:flutter/material.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: NewestListViewItem(book: books[index]),
          );
        });
  }
}
