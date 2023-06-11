
import 'package:bibleapp/features/books/model/chapters.dart';
import 'package:bibleapp/helpers/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_data.freezed.dart';
part 'book_data.g.dart';


@freezed
class BookData with _$BookData {
  const factory BookData({
    required String id,
    required String bibleId,
    required String abbreviation,
    required String name,
    required String nameLong,
    required List<BookChapter> chapters,
  }) = _BookData;

  factory BookData.fromJson(JSON json) =>
      _$BookDataFromJson(json);
}

