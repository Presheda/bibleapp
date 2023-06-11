import 'package:bibleapp/features/books/model/export_model.dart';
import 'package:bibleapp/network/api_endpoint.dart';
import 'package:bibleapp/network/api_service.dart';
import 'package:bibleapp/network/api_service_impl.dart';

import 'books_repository_interface.dart';

/// Talks to the production endpoint
class BooksRepositoryImpl extends BooksRepositoryInterface {
  ApiService apiService;

  BooksRepositoryImpl({ApiService? apiService})
      : apiService = apiService ?? ApiServiceImpl.getApiService();

  /// A bible is made up of books, books are made up of chapters, and chapters verses
  /// to call books, one first need to know what version of the bible we are calling the books from
  /// for now, we will use a default bible version

  @override
  Future<List<BookData>> fetchAllBooks({Map<String, dynamic>? data}) async {
    List<BookData> books;
    String bibleVersion =
        "de4e12af7f28f599-01 "; // default bible de4e12af7f28f599-01
    BibleData bibleData = await apiService.getDocumentData(
        endpoint: ApiEndpoint.books(BooksEndpoint.BOOKS, bibleId: bibleVersion),
        requiresAuthToken: false,
        converter: BibleData.fromJson);
    return bibleData.books;
  }

  @override
  Future<BookData> fetchBookDetail({Map<String, dynamic>? data}) async {
    String bibleVersion =
        "de4e12af7f28f599-01 "; // default bible de4e12af7f28f599-01
    BookData books;

    books = await apiService.getDocumentData(
        endpoint: ApiEndpoint.books(BooksEndpoint.BOOKS),
        requiresAuthToken: false,
        converter: BookData.fromJson);
    return books;
  }
}
