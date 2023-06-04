// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible_books.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BibleBooks _$$_BibleBooksFromJson(Map<String, dynamic> json) =>
    _$_BibleBooks(
      abbrev: Abbrev.fromJson(json['abbrev'] as Map<String, dynamic>),
      testament: json['testament'] as String,
      name: json['name'] as String,
      author: json['author'] as String,
      group: json['group'] as String,
      chapters: json['chapters'] as int,
    );

Map<String, dynamic> _$$_BibleBooksToJson(_$_BibleBooks instance) =>
    <String, dynamic>{
      'abbrev': instance.abbrev,
      'testament': instance.testament,
      'name': instance.name,
      'author': instance.author,
      'group': instance.group,
      'chapters': instance.chapters,
    };
