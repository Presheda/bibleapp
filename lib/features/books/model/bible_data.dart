import 'package:bibleapp/features/books/model/book_data.dart';
import 'package:bibleapp/helpers/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bible_data.freezed.dart';
part 'bible_data.g.dart';

@freezed
class BibleData with _$BibleData {
  const factory BibleData({required List<BookData> bookData}) = _BibleData;


  factory BibleData.fromJson (JSON json)=> _$BibleDataFromJson(json);
}
