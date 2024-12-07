import 'package:bookly_app/core/errors/failures.dart';

import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_reomte_data_source.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeReomteDataSource homeReomteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeReomteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetctFeaturedBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetctFeaturedBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeReomteDataSource.fetctFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetctNewestBooks() async {
    try {
     List<BookEntity> books;
      books = homeLocalDataSource.fetctNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeReomteDataSource.fetctNewestBooks();
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetctSimilerBooks(
      {required String category}) async {
    try {
     List<BookEntity> books;
      books = homeLocalDataSource.fetctSimilerBooks(category: category);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeReomteDataSource.fetctSimilerBooks(category: category);
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
