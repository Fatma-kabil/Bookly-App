import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestListViewItem extends StatelessWidget {
  const NewestListViewItem({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
                imageUrl: book.image ?? ''),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      book.title,
                      style: Styles.textStyle22,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Opacity(
                    opacity: .7,
                    child: Text(
                       maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle16,
                      book.authorName??"",
                  ),
                    ),
                  const SizedBox(
                    height: 3,),
                  Row(
                    children:[
                       Text(
                         'Free',
                        style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: book.rating?.round() ?? 0,
                        count: book.count ?? 0,
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
  }
}
