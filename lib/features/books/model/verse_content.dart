import 'package:bibleapp/helpers/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'chapter_reference.dart';
import 'verse_paragraph.dart';

part 'verse_content.freezed.dart';
part 'verse_content.g.dart';

@freezed
class VerseContent with _$VerseContent {
  const factory VerseContent({
    required String id,
    required String bibleId,
    required String number,
    required String bookId,
    required String reference,
    required String copyright,
    required int verseCount,
    required List<VerseParagraph> content,
    ChapterReference? next,
    ChapterReference? previous,
  }) = _VerseContent;

  factory VerseContent.fromJson(JSON json) => _$VerseContentFromJson(json);
}
