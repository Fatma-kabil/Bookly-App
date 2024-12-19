import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListview extends StatefulWidget {
  const FeaturedBooksListview({
    super.key,
    required this.books,
    // Callback to fetch more books
  });

  final List<BookEntity> books;

  @override
  State<FeaturedBooksListview> createState() => _FeaturedBooksListviewState();
}

class _FeaturedBooksListviewState extends State<FeaturedBooksListview> {
  late final ScrollController _scrollController;
  var nextPage = 1;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Add a listener to trigger the fetch when 70% of the scroll is reached
    _scrollController.addListener(() async {
      final position = _scrollController.position;
      if (position.pixels >= position.maxScrollExtent * 0.7 &&
          !position.outOfRange) {
        if (!isLoading) {
          isLoading = true;
          await BlocProvider.of<FeaturedBooksCubit>(context)
              .fetchFeaturedBooks(pageNamber: nextPage++);
          isLoading = false;
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.builder(
        controller: _scrollController, // Attach the ScrollController
        physics: const BouncingScrollPhysics(),
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.kBookDetailsView,
                  extra: widget.books[index],
                );
              },
              child: CustomBookImage(
                imageUrl: widget.books[index].image ?? "",
              ),
            ),
          );
        },
      ),
    );
  }
}
