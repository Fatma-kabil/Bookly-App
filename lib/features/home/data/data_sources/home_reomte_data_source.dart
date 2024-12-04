import 'package:bookly_app/features/home/domain/entites/book_entity.dart';

abstract class HomeReomteDataSource {
  Future<List<BookEntity>> fetctNewestBooks();
  Future<List<BookEntity>> fetctFeaturedBooks();
  Future<List<BookEntity>> fetctSimilerBooks({required String category});
}

class HomeReomteDataSourceImpl extends HomeReomteDataSource {
  @override
  Future<List<BookEntity>> fetctFeaturedBooks() {
    // TODO: implement fetctFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetctNewestBooks() {
    // TODO: implement fetctNewestBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetctSimilerBooks({required String category}) {
    // TODO: implement fetctSimilerBooks
    throw UnimplementedError();
  }
}
