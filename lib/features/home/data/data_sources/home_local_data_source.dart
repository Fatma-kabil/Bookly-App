import 'package:bookly_app/features/home/domain/entites/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity>fetctNewestBooks();
  List<BookEntity> fetctFeaturedBooks();
  List<BookEntity> fetctSimilerBooks({required String category});
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetctFeaturedBooks() {
    // TODO: implement fetctFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetctNewestBooks() {
    // TODO: implement fetctNewestBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetctSimilerBooks({required String category}) {
    // TODO: implement fetctSimilerBooks
    throw UnimplementedError();
  }
}
