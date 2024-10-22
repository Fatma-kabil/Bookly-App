part of 'searchview_cubit.dart';

sealed class SearchviewState extends Equatable {
  const SearchviewState();

  @override
  List<Object> get props => [];
}

final class SearchviewInitial extends SearchviewState {}
final class SreachViewLoading extends SearchviewState {}

final class SearchviewSucccess extends SearchviewState {
  final List<BookModel> books;

  const SearchviewSucccess({required this.books});
}

final class SreachViewFailure extends SearchviewState {
  final String errMessage;

  const SreachViewFailure({required this.errMessage});
}
