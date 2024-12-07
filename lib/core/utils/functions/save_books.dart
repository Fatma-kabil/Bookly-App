import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:hive/hive.dart';

void saveData(List<BookEntity> books,String boxName) {
    var box = Hive.box(boxName);
    box.addAll(books);
  }
  
 