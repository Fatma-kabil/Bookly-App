import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';

import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';

import 'package:bookly_app/features/home/presentation/views/widgets/featured_listview_shimmer.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featuredbookslistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({super.key});

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() =>
      _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState
    extends State<FeaturedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSucccess) {
          books.addAll(books);
        }
      },
      builder: (context, state) {
        return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
          builder: (context, state) {
            if (state is FeaturedBooksSucccess ||
                state is FeaturedBooksPaginationLoading) {
              return FeaturedBooksListview(
                  books: books);
            } else if (state is FeaturedBooksFailure) {
              return CustomErrorWidget(errMessage: state.errMessage);
            } else {
              return const FeaturedListviewShimmer();
            }
          },
        );
      },
    );
  }
}
