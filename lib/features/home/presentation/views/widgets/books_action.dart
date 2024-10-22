import 'package:bookly_app/core/widgets/custom_botton.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.book});
  final BookModel book;
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
            onPressed: () async {
              Uri uri = Uri.parse(book.volumeInfo.previewLink!);
              if (await canLaunchUrl(uri)) {
             
                await launchUrl(uri);
              }
            },
            fontsize: 16,
            text: 'Preview',
            backgroundcolor:const Color(0xffEF8262),
            textcolor: Colors.white,
            borderRadius:const BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16)),
          ))
        ],
      ),
    );
  }
}
