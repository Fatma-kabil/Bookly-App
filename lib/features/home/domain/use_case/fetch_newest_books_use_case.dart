import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/use_cases/use_case.dart';

import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int  pageNamber=0]) async {
    return await homeRepo.fetctNewestBooks(pageNamber: pageNamber);
  }
}
