import 'package:bibleapp/helpers/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'chapter_reference.dart';
import 'verse_attrs.dart';
import 'verse_content.dart';

/// Okay, so we are calling a verse in the api without specifying a verseId, this will force it
/// to return all the verses in the chapter we passed in
/// the query is in the form of GEN.2
/// it returns all the verses in Genesis chapter 2
///

part 'verse.freezed.dart';
part 'verse.g.dart';

@freezed
class VerseResponse with _$VerseResponse {
  factory VerseResponse({
    required VerseContent data,
  }) =  _VerseResponse;

  factory VerseResponse.fromJson(JSON json) => _$VerseResponseFromJson(json);
}

// class VerseResponse {
//   VerseContent data;
//
//   VerseResponse({
//     required this.data,
//   });
//
//   factory VerseResponse.fromJson(Map<String, dynamic> json) {
//     return VerseResponse(
//       data: VerseContent.fromJson(json['data']),
//     );
//   }
// }

//
// class VerseContent {
//   String id;
//   String bibleId;
//   String number;
//   String bookId;
//   String reference;
//   String copyright;
//   int verseCount;
//   List<VerseParagraph> content;
//   ChapterReference? next;
//   ChapterReference? previous;
//
//   VerseContent({
//     required this.id,
//     required this.bibleId,
//     required this.number,
//     required this.bookId,
//     required this.reference,
//     required this.copyright,
//     required this.verseCount,
//     required this.content,
//     this.next,
//     this.previous,
//   });
//
//   factory VerseContent.fromJson(Map<String, dynamic> json) {
//     return VerseContent(
//       id: json['id'],
//       bibleId: json['bibleId'],
//       number: json['number'],
//       bookId: json['bookId'],
//       reference: json['reference'],
//       copyright: json['copyright'],
//       verseCount: json['verseCount'],
//       content: List<VerseParagraph>.from(
//           json['content'].map((item) => VerseParagraph.fromJson(item))),
//       next: json['next'] != null
//           ? ChapterReference.fromJson(json['next'])
//           : null,
//       previous: json['previous'] != null
//           ? ChapterReference.fromJson(json['previous'])
//           : null,
//     );
//   }
// }

// class VerseParagraph {
//   String name;
//   String type;
//   VerseAttrs attrs;
//   List<VerseItem> items;
//
//   VerseParagraph({
//     required this.name,
//     required this.type,
//     required this.attrs,
//     required this.items,
//   });
//
//   factory VerseParagraph.fromJson(Map<String, dynamic> json) {
//     return VerseParagraph(
//       name: json['name'],
//       type: json['type'],
//       attrs: VerseAttrs.fromJson(json['attrs']),
//       items: List<VerseItem>.from(
//           json['items'].map((item) => VerseItem.fromJson(item))),
//     );
//   }
// }

// class VerseItem {
//   String text;
//   String type;
//   VerseAttrs attrs;
//   List<VerseItem> items;
//
//   VerseItem({
//     required this.text,
//     required this.type,
//     required this.attrs,
//     required this.items,
//   });
//
//   factory VerseItem.fromJson(Map<String, dynamic> json) {
//     return VerseItem(
//       text: json['text'],
//       type: json['type'],
//       attrs: VerseAttrs.fromJson(json['attrs']),
//       items: json['items'] != null
//           ? List<VerseItem>.from(
//           json['items'].map((item) => VerseItem.fromJson(item)))
//           : [],
//     );
//   }
// }

// class ChapterReference {
//   String id;
//   String number;
//   String bookId;
//
//   ChapterReference({
//     required this.id,
//     required this.number,
//     required this.bookId,
//   });
//
//   factory ChapterReference.fromJson(Map<String, dynamic> json) {
//     return ChapterReference(
//       id: json['id'],
//       number: json['number'],
//       bookId: json['bookId'],
//     );
//   }
// }

//
// class VerseAttrs {
//   String style;
//   String verseId;
//   List<String> verseOrgIds;
//
//
//   VerseAttrs({
//     required this.style,
//     required this.verseId,
//     required this.verseOrgIds
//   });
//
//   factory VerseAttrs.fromJson(Map<String, dynamic> json) {
//     return VerseAttrs(
//         style: json['style'],
//         verseId: json['versionId'],
//         verseOrgIds: List<String>.from(json['verseOrgIds'])
//     );
//   }
// }
