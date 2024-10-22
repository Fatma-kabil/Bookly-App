import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'searchview_state.dart';

class SearchviewCubit extends Cubit<SearchviewState> {
  SearchviewCubit(this.homerepo) : super(SearchviewInitial());

   final HomeRepo homerepo;
  Future<void> searhBooks() async {
    emit(SreachViewLoading());
    var result = await homerepo.fetctFeaturedBooks();

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
