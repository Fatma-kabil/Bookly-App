import 'package:bloc/bloc.dart';

import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_case/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
 
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchBestSellerBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.call();

    result.fold(
      (failure) {
        emit(NewestBooksFailure(errMessage: failure.errorMessage));
      },
      (books) {
        emit(NewestBooksSuccess(books: books));
      },
    );
  }
}
