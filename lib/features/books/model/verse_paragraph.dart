
import 'package:bibleapp/features/books/model/verse_attrs.dart';
import 'package:bibleapp/features/books/model/verse_item.dart';
import 'package:bibleapp/helpers/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verse_paragraph.freezed.dart';
part 'verse_paragraph.g.dart';

@freezed
class VerseParagraph with _$VerseParagraph {

  const factory  VerseParagraph({
    String? name,
    String? type,
    VerseAttrs? attrs,
    List<VerseItem>? items,
}) = _VerseParagraph;

  factory VerseParagraph.fromJson(JSON json) => _$VerseParagraphFromJson(json);
}


