import 'package:bookly_app/features/home/presentation/views/widgets/newest_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: true,

      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          //  child: BestSellerListViewItem(),
          child: Text(" "),
        );
      },
    );
  }
}
