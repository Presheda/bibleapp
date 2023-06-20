import 'package:freezed_annotation/freezed_annotation.dart';

import 'verse_search_result.dart';

part 'verse_search_data.freezed.dart';
part 'verse_search_data.g.dart';

@freezed
class VerseSearchData with _$VerseSearchData {
  const factory VerseSearchData({
    required String query,
    required int limit,
    required int offset,
    required int total,
    required int verseCount,
    required List<VerseSearchResult> verses,
  }) = $VerseSearchData;

  factory VerseSearchData.fromJson(Map<String, dynamic> json) => _$VerseSearchDataFromJson(json);
}
