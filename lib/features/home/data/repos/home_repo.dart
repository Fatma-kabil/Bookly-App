import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetctNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetctFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetctSimilerBooks(
      {required String category});
}
