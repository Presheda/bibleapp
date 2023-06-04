// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bible_books.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BibleBooks _$BibleBooksFromJson(Map<String, dynamic> json) {
  return _BibleBooks.fromJson(json);
}

/// @nodoc
mixin _$BibleBooks {
  Abbrev get abbrev => throw _privateConstructorUsedError;
  String get testament => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get group => throw _privateConstructorUsedError;
  int get chapters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BibleBooksCopyWith<BibleBooks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BibleBooksCopyWith<$Res> {
  factory $BibleBooksCopyWith(
          BibleBooks value, $Res Function(BibleBooks) then) =
      _$BibleBooksCopyWithImpl<$Res, BibleBooks>;
  @useResult
  $Res call(
      {Abbrev abbrev,
      String testament,
      String name,
      String author,
      String group,
      int chapters});

  $AbbrevCopyWith<$Res> get abbrev;
}

/// @nodoc
class _$BibleBooksCopyWithImpl<$Res, $Val extends BibleBooks>
    implements $BibleBooksCopyWith<$Res> {
  _$BibleBooksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? abbrev = null,
    Object? testament = null,
    Object? name = null,
    Object? author = null,
    Object? group = null,
    Object? chapters = null,
  }) {
    return _then(_value.copyWith(
      abbrev: null == abbrev
          ? _value.abbrev
          : abbrev // ignore: cast_nullable_to_non_nullable
              as Abbrev,
      testament: null == testament
          ? _value.testament
          : testament // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AbbrevCopyWith<$Res> get abbrev {
    return $AbbrevCopyWith<$Res>(_value.abbrev, (value) {
      return _then(_value.copyWith(abbrev: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BibleBooksCopyWith<$Res>
    implements $BibleBooksCopyWith<$Res> {
  factory _$$_BibleBooksCopyWith(
          _$_BibleBooks value, $Res Function(_$_BibleBooks) then) =
      __$$_BibleBooksCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Abbrev abbrev,
      String testament,
      String name,
      String author,
      String group,
      int chapters});

  @override
  $AbbrevCopyWith<$Res> get abbrev;
}

/// @nodoc
class __$$_BibleBooksCopyWithImpl<$Res>
    extends _$BibleBooksCopyWithImpl<$Res, _$_BibleBooks>
    implements _$$_BibleBooksCopyWith<$Res> {
  __$$_BibleBooksCopyWithImpl(
      _$_BibleBooks _value, $Res Function(_$_BibleBooks) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? abbrev = null,
    Object? testament = null,
    Object? name = null,
    Object? author = null,
    Object? group = null,
    Object? chapters = null,
  }) {
    return _then(_$_BibleBooks(
      abbrev: null == abbrev
          ? _value.abbrev
          : abbrev // ignore: cast_nullable_to_non_nullable
              as Abbrev,
      testament: null == testament
          ? _value.testament
          : testament // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BibleBooks implements _BibleBooks {
  const _$_BibleBooks(
      {required this.abbrev,
      required this.testament,
      required this.name,
      required this.author,
      required this.group,
      required this.chapters});

  factory _$_BibleBooks.fromJson(Map<String, dynamic> json) =>
      _$$_BibleBooksFromJson(json);

  @override
  final Abbrev abbrev;
  @override
  final String testament;
  @override
  final String name;
  @override
  final String author;
  @override
  final String group;
  @override
  final int chapters;

  @override
  String toString() {
    return 'BibleBooks(abbrev: $abbrev, testament: $testament, name: $name, author: $author, group: $group, chapters: $chapters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BibleBooks &&
            (identical(other.abbrev, abbrev) || other.abbrev == abbrev) &&
            (identical(other.testament, testament) ||
                other.testament == testament) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.chapters, chapters) ||
                other.chapters == chapters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, abbrev, testament, name, author, group, chapters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BibleBooksCopyWith<_$_BibleBooks> get copyWith =>
      __$$_BibleBooksCopyWithImpl<_$_BibleBooks>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BibleBooksToJson(
      this,
    );
  }
}

abstract class _BibleBooks implements BibleBooks {
  const factory _BibleBooks(
      {required final Abbrev abbrev,
      required final String testament,
      required final String name,
      required final String author,
      required final String group,
      required final int chapters}) = _$_BibleBooks;

  factory _BibleBooks.fromJson(Map<String, dynamic> json) =
      _$_BibleBooks.fromJson;

  @override
  Abbrev get abbrev;
  @override
  String get testament;
  @override
  String get name;
  @override
  String get author;
  @override
  String get group;
  @override
  int get chapters;
  @override
  @JsonKey(ignore: true)
  _$$_BibleBooksCopyWith<_$_BibleBooks> get copyWith =>
      throw _privateConstructorUsedError;
}
