import 'package:bookly_app/conatants.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetctNewestBooks();
  List<BookEntity> fetctFeaturedBooks();
  List<BookEntity> fetctSimilerBooks({required String category});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetctFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);

    return box.values.toList();
  }

  @override
  List<BookEntity> fetctNewestBooks() {
   var box = Hive.box<BookEntity>(kNewestBox);

    return box.values.toList();
  }

  @override
  List<BookEntity> fetctSimilerBooks({required String category}) {
 var box = Hive.box<BookEntity>(kSimilarBox);

    return box.values.toList();
  }
}
