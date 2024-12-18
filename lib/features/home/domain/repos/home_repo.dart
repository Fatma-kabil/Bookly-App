import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetctNewestBooks();
  Future<Either<Failure, List<BookEntity>>> fetctFeaturedBooks({int pageNamber=0});
  Future<Either<Failure, List<BookEntity>>> fetctSimilerBooks(
      {required String category});
}
