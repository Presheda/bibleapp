

import 'package:bibleapp/features/books/model/verse_attrs.dart';
import 'package:bibleapp/helpers/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'verse_item.freezed.dart';
part 'verse_item.g.dart';

@freezed
class VerseItem with _$VerseItem{


 factory VerseItem({
    String? text,
    String? type,
    VerseAttrs? attrs,
    List<VerseItem>? items,
  }) = _VerseItem;

  factory VerseItem.fromJson(JSON json) => _$VerseItemFromJson(json);
}