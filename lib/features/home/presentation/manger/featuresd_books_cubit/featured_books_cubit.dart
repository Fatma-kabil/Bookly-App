import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';

import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homerepo) : super(FeaturedBooksInitial());

  final HomeRepo homerepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homerepo.fetctFeaturedBooks();

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
