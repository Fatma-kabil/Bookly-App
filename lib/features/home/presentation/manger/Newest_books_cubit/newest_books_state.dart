part of 'Newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}
final class NewestBooksPaginationLoading extends NewestBooksState {}
final class NewestBooksPaginationFailure extends NewestBooksState {
   final String errMessage;

  const NewestBooksPaginationFailure({required this.errMessage});
}


final class NewestBooksFailure extends NewestBooksState {
  final String errMessage;

  const NewestBooksFailure({required this.errMessage});
}

final class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  const NewestBooksSuccess({required this.books});
}
