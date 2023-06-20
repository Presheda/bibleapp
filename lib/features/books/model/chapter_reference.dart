

import 'package:bibleapp/helpers/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chapter_reference.freezed.dart';
part 'chapter_reference.g.dart';
@freezed
class ChapterReference with _$ChapterReference {


  factory ChapterReference({
    required String id,
    required String number,
    required String bookId,
  }) = _ChapterReference;

  factory ChapterReference.fromJson(JSON json) => _$ChapterReferenceFromJson(json);
}
