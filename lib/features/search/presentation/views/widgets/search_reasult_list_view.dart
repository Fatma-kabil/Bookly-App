import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';

import 'package:bookly_app/features/home/presentation/views/widgets/newest_list_view_bloc_builder.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_list_view_item.dart';

import 'package:bookly_app/features/search/presentation/manger/search_cubit.dart/searchview_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchviewCubit, SearchviewState>(
      builder: (context, state) {
        if (state is SearchviewSucccess && state.books.isNotEmpty) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: NewestListViewItem(book: state.books[index]),
                );
              },
            ),
          );
        } else if (state is SearchviewSucccess && state.books.isEmpty) {
          return const Center(
            child:  Text(
              "No Result Founded 🔎",
              style:Styles.textStyle18 ,
            ),
          );
        } else if (state is SreachViewFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SreachViewLoading) {
          return const CustomLoadingIndicator();
        } else {
          return const NewestListViewBlocBuilder();
        }
      },
    );
  }
}