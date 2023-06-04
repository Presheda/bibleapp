import 'package:bibleapp/network/config.dart';

class ApiEndpoint {
  ApiEndpoint._();

  static const baseUrl = Config.baseUrl;

  /// Returns the path for an authentication [endpoint].
  static String books(BooksEndpoint endpoint, {String? abbrev}) {
    const path = '';
    switch (endpoint) {
      case BooksEndpoint.BOOKS:
        return '$path/books';
      case BooksEndpoint.SINGLE_BOOK:
        return '$path/books/$abbrev';
    }
  }
}

/// A collection of endpoints used for authentication purposes.
enum BooksEndpoint {
  BOOKS,
  SINGLE_BOOK,
}
