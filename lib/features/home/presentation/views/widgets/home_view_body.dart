import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/manger/Newest_books_cubit/Newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_list_view_bloc_builder.dart';

import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view_bloc_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
          setState(() {
            isLoading = true;
          });
          await BlocProvider.of<NewestBooksCubit>(context)
              .fetchNewestBooks(pageNamber: nextPage++);
          setState(() {
            isLoading = false;
          });
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
    return CustomScrollView(
     // controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: CustomAppBar(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: FeaturedBooksListViewBlocBuilder(),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Newest Books', style: Styles.textStyle21),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
          SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: NewestListViewBlocBuilder(),
          ),
        ),
      ],
    );
  }
}
