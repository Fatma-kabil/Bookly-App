
import 'package:bookly_app/core/widgets/custom_error_widget.dart';

import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';

import 'package:bookly_app/features/home/presentation/views/widgets/featured_listview_shimmer.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featuredbookslistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSucccess) {
          return FeaturedBooksListview(books: state.books,);
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const FeaturedListviewShimmer();
        }
      },
    );
  }
}
