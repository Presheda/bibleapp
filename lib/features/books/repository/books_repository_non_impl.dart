
import 'package:bibleapp/features/books/model/export_model.dart';

import 'books_repository_interface.dart';

/// does not talk to production, just for testing and staging or fake api
class BooksRepositoryNonImpl implements BooksRepositoryInterface {
  @override
  Future<List<BookData>> fetchAllBooks({Map<String, dynamic>? data}) async{
    return [];
  }

  @override
  Future<BookData> fetchBookDetail({Map<String, dynamic>? data}) {
    // TODO: implement fetchBookDetail
    throw UnimplementedError();
  }
}
