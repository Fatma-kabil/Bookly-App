part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}
final class FeaturedBooksPaginationLoading extends FeaturedBooksState {}
final class FeaturedBooksPaginationFailure extends FeaturedBooksState {
   final String errMessage;

  const FeaturedBooksPaginationFailure({required this.errMessage});
}

final class FeaturedBooksSucccess extends FeaturedBooksState {
  final List<BookEntity> books;

  const FeaturedBooksSucccess({required this.books});
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMessage;

  const FeaturedBooksFailure({required this.errMessage});
}
