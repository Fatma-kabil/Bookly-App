
import 'package:bookly_app/core/widgets/custom_error_widget.dart';

import 'package:bookly_app/features/home/presentation/manger/Newest_books_cubit/Newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_listview_shimmer%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewestListViewBlocBuilder extends StatelessWidget {
  const NewestListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            // shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: NewestListViewItem(book: state.books[index]),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const NewestListviewShimmer();
        }
      },
    );
  }
}

