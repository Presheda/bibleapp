import 'package:bibleapp/helpers/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'verse_search_data.dart';

part 'verse_search_response.freezed.dart';
part 'verse_search_response.g.dart';


@freezed
class VerseSearchResponse with _$VerseSearchResponse {
  const factory VerseSearchResponse({
    required VerseSearchData data,

  }) = _VerseSearchResponse;

  factory VerseSearchResponse.fromJson(JSON json) =>
      _$VerseSearchResponseFromJson(json);
}



