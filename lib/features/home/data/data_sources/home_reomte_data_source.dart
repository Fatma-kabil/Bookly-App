import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';

abstract class HomeReomteDataSource {
  Future<List<BookEntity>> fetctNewestBooks();
  Future<List<BookEntity>> fetctFeaturedBooks();
  Future<List<BookEntity>> fetctSimilerBooks({required String category});
}

class HomeReomteDataSourceImpl extends HomeReomteDataSource {
  final ApiService apiService;

  HomeReomteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetctFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?q=Programming&Filtering=free-ebooks');

    List<BookEntity> books = getBooksList(data);
    return books;
  }

  
  @override
  Future<List<BookEntity>> fetctNewestBooks()async {
    var data = await apiService.get(
        endPoint: 'volumes?q==computer science&Filtering=free-ebooks&Sorting=newest');

    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetctSimilerBooks({required String category}) {
    // TODO: implement fetctSimilerBooks
    throw UnimplementedError();
  }
  List<BookEntity> getBooksList(Map<String, dynamic> data) {
     List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }

}
