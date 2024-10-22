import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/manger/Newest_books_cubit/Newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_list_view_item.dart';

import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_reasult_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    BlocProvider.of<NewestBooksCubit>(context).fetchBestSellerBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustumSearchTextField(),
          const SizedBox(
            height: 16,
          ),
          Text('Search Result',
              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 16,
          ),
          const Expanded(child: NewestListView())
        ],
      ),
    );
  }
}
