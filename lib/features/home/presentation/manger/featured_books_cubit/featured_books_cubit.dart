import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';

import 'package:bookly_app/features/home/domain/use_case/fetch_featured_books_use_case.dart';

import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await featuredBooksUseCase.call();

    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(errMessage: failure.errorMessage));
      },
      (books) {
        emit(FeaturedBooksSucccess(books: books));
      },
    );
  }
}
