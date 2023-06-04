import 'package:bibleapp/features/books/model/bible_books.dart';

import 'books_repository_interface.dart';

/// does not talk to production, just for testing and staging or fake api
class BooksRepositoryNonImpl implements BooksRepositoryInterface {
  @override
  Future<List<BibleBooks>> fetchAllBooks({Map<String, dynamic>? data}) async{
    return [];
  }

  @override
  Future<BibleBooks> fetchBookDetail({Map<String, dynamic>? data}) {
    // TODO: implement fetchBookDetail
    throw UnimplementedError();
  }
}
