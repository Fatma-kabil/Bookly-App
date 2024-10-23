
import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';

import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'searchview_state.dart';

class SearchviewCubit extends Cubit<SearchviewState> {
  SearchviewCubit(this.searchRepo) : super(SearchviewInitial());

   final SearchRepo searchRepo;
  Future<void> searhBooks({required String searchKeyWord}) async {
    emit(SreachViewLoading());
    var result = await searchRepo.fetchSearchBooks(searchKeyWord: searchKeyWord);

    result.fold(
      (failure) {
        emit(SreachViewFailure(errMessage: failure.errorMessage));
      },
      (books) {
        emit(SearchviewSucccess(books: books));
      },
    );
  }
}

