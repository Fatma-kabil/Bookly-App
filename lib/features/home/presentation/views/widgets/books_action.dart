import 'package:bookly_app/core/utils/functions/launch_url.dart';
import 'package:bookly_app/core/widgets/custom_botton.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:flutter/material.dart';


class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            text: 'Free',
            backgroundcolor: Colors.white,
            textcolor: Colors.black,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16), topLeft: Radius.circular(16)),
          )),
          Expanded(
              child: CustomButton(
            onPressed: ()  {
              launchCustomUrl(context, book.plink);
            },
            fontsize: 16,
            text: getText(book),
            backgroundcolor: const Color(0xffEF8262),
            textcolor: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16)),
          ))
        ],
      ),
    );
  }

  String getText(BookEntity book) {
    if (book.plink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
