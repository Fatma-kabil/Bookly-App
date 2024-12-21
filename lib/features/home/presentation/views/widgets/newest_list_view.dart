import 'package:flutter/material.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_list_view_item.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 30,),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final book = books[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: NewestListViewItem(book: book),
            );
          },
          childCount: books.length,
        ),
      ),
    );
  }
}
