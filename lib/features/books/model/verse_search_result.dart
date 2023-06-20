
import 'package:bibleapp/helpers/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verse_search_result.freezed.dart';
part 'verse_search_result.g.dart';

@freezed
class VerseSearchResult with _$VerseSearchResult {
  const factory VerseSearchResult({
    required String id,
    required String orgId,
    required String bookId,
    required String bibleId,
    required String chapterId,
    required String reference,
    required String text,
  }) = _VerseSearchResult;

  factory VerseSearchResult.fromJson(JSON json) => _$VerseSearchResultFromJson(json);
}
