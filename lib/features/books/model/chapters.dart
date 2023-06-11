
import 'package:bibleapp/helpers/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part  'chapters.freezed.dart';
part  'chapters.g.dart';


@freezed
class BookChapter with _$BookChapter {

  const factory BookChapter({
    required String id,
    required String bibleId,
    required String bookId,
    required String number,
    required int position,
  }) = _BookChapter;

  factory BookChapter.fromJson (JSON json) => _$BookChapterFromJson(json);
}