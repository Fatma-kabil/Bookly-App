import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: SizedBox(
        height: 140,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.7 / 4,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          AssetsData.testImage,
                        ))),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      'Harry Potter and the Goblet of Fire',
                      style: Styles.textStyle22,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    'J.K.Rowling',
                    style: Styles.textStyle16,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        '19.99£',
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const BookRating(),
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
