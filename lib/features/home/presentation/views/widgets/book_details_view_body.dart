import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * .16;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: CustomBookDetailsAppBar(),
          ),
          Padding(
            padding: EdgeInsets.only(left: width, right: width, top: 45),
            child: const CustomBookImage(),
          ),
        ],
      ),
    );
  }
}
