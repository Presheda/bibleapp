import 'package:bibleapp/books/model/bible_abbrev.dart';

import 'package:freezed_annotation/freezed_annotation.dart';


part 'bible_books.freezed.dart';
part 'bible_books.g.dart';

@freezed
class BibleBooks with _$BibleBooks {
  const factory BibleBooks({
    required Abbrev abbrev,
    required String testament,
    required String name,
    required String author,
    required String group,
    required int chapters,
  }) = _BibleBooks;

  factory BibleBooks.fromJson(Map<String, Object> json) => _$BibleBooksFromJson(json);
}
