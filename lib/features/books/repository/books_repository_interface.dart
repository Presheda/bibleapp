
import 'package:bibleapp/features/books/model/book_data.dart';
import 'package:bibleapp/helpers/typedefs.dart';

/// the purpose of the interface is to define the contract of the class,
/// we might want to supply production repository or testing repository where we manipulate the impl for testing
abstract class BooksRepositoryInterface {
  Future<List<BookData>> fetchAllBooks({JSON? data});
  Future<BookData> fetchBookDetail({Map<String, dynamic>? data});

  Future<dynamic> searchVerse({required String query});
}


