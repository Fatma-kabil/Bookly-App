import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'best_seller_books_state.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksState> {
  BestSellerBooksCubit(this.homeRepo) : super(BestSellerBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerBooksLoading());
    var result = await homeRepo.fetctNewestBooks();

    result.fold(
      (failure) {
        emit(BestSellerBooksFailure(errMessage: failure.errorMessage));
      },
      (books) {
        emit(BestSellerBooksSuccess(books: books));
      },
    );
  }
}
