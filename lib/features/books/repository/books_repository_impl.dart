import 'package:bibleapp/features/books/model/bible_books.dart';
import 'package:bibleapp/network/api_endpoint.dart';
import 'package:bibleapp/network/api_service.dart';
import 'package:bibleapp/network/api_service_impl.dart';

import 'books_repository_interface.dart';

/// Talks to the production endpoint
class BooksRepositoryImpl extends BooksRepositoryInterface {
  ApiService apiService;

  BooksRepositoryImpl({ApiService? apiService})
      : apiService = apiService ?? ApiServiceImpl.getApiService();

  @override
  Future<List<BibleBooks>> fetchAllBooks({Map<String, dynamic>? data}) async {
    List<BibleBooks> books;

    books = await apiService.getCollectionData(
        endpoint: ApiEndpoint.books(BooksEndpoint.BOOKS),
        requiresAuthToken: false,
        converter: BibleBooks.fromJson);
    return books;
  }

  @override
  Future<BibleBooks> fetchBookDetail({Map<String, dynamic>? data}) async {
    BibleBooks books;

    books = await apiService.getDocumentData(
        endpoint: ApiEndpoint.books(BooksEndpoint.BOOKS),
        requiresAuthToken: false,
        converter: BibleBooks.fromJson);
    return books;
  }
}
