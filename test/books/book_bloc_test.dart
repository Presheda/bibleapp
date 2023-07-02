import 'package:bibleapp/features/books/model/verse_search_data.dart';
import 'package:bibleapp/features/books/model/verse_search_response.dart';
import 'package:bibleapp/features/books/repository/books_repository_impl.dart';
import 'package:bibleapp/features/books/repository/books_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'book_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BooksRepositoryImpl>()])
void main() {
  var repo = MockBooksRepositoryImpl();


  when(repo.searchVerse(
    query: anyNamed(
      "query",
    ),
  )).thenAnswer(  (realInvocation)  => Future.value(null));
}
