
import 'package:bibleapp/helpers/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'verse_attrs.freezed.dart';
part 'verse_attrs.g.dart';

@freezed
class VerseAttrs with _$VerseAttrs{

  factory VerseAttrs ({
    String? style,
    String? verseId,
    List<String>? verseOrgIds
   }) =  _VerseAttrs;

  factory VerseAttrs.fromJson(JSON json) => _$VerseAttrsFromJson(json);
}