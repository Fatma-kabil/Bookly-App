import 'package:bloc/bloc.dart';

import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_case/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
 
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNamber = 0}) async {
     if (pageNamber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }
   
    var result = await fetchNewestBooksUseCase.call(pageNamber);

    result.fold(
      (failure) {
        if(pageNamber==0){
          emit(NewestBooksFailure(errMessage: failure.errorMessage));
        }
        else{
          emit(NewestBooksPaginationFailure(errMessage: failure.errorMessage));
        }
      },
      (books) {
        emit(NewestBooksSuccess(books: books));
      },
    );
  }
}
