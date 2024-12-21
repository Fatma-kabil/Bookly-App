import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';

import 'package:bookly_app/features/home/presentation/manger/Newest_books_cubit/Newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_listview_shimmer%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListViewBlocBuilder extends StatefulWidget {
  const NewestListViewBlocBuilder({super.key});

  @override
  State<NewestListViewBlocBuilder> createState() =>
      _NewestListViewBlocBuilderState();
}

class _NewestListViewBlocBuilderState extends State<NewestListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
        
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationFailure ||
            state is NewestBooksPaginationLoading) {
          return NewestListView(
            books: books,
          );
        } else if (state is NewestBooksFailure) {
          return 
          SliverToBoxAdapter(child: CustomErrorWidget(errMessage: state.errMessage));
        } else {
          return SliverToBoxAdapter(child: const NewestListviewShimmer());
        }
      },
    );
  }
}
