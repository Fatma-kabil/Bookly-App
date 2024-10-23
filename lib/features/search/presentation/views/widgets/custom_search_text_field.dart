import 'package:bookly_app/features/search/presentation/manger/search_cubit.dart/searchview_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustumSearchTextField extends StatelessWidget {
  const CustumSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
     onSubmitted: (value) async {
        await BlocProvider.of<SearchviewCubit>(context)
            .searhBooks(searchKeyWord: value);
      
      },
        decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            hintText: 'Search',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Opacity(
                  opacity: 0.8, child: Icon(FontAwesomeIcons.magnifyingGlass)),
              iconSize: 20,
            )));
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white70),
        borderRadius: BorderRadius.circular(12));
  }
}
