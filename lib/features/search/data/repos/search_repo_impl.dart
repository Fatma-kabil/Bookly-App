import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';

import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
      {required String searchKeyWord}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=$searchKeyWord&Filtering=free-ebooks&Sorting=newest');

      List<BookModel> books = [];
      for (var item in data['items']) {
        BookModel book = BookModel.fromJson(item);

          // Filter books where the title starts with the search keyword
          if (book.volumeInfo.title!.toLowerCase().contains(searchKeyWord.toLowerCase())) {
            books.add(book);
          }
        }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
 
}
