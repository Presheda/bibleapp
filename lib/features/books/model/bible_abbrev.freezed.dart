// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bible_abbrev.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Abbrev _$AbbrevFromJson(Map<String, dynamic> json) {
  return _Abbrev.fromJson(json);
}

/// @nodoc
mixin _$Abbrev {
  String get pt => throw _privateConstructorUsedError;
  String get en => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbbrevCopyWith<Abbrev> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbbrevCopyWith<$Res> {
  factory $AbbrevCopyWith(Abbrev value, $Res Function(Abbrev) then) =
      _$AbbrevCopyWithImpl<$Res, Abbrev>;
  @useResult
  $Res call({String pt, String en});
}

/// @nodoc
class _$AbbrevCopyWithImpl<$Res, $Val extends Abbrev>
    implements $AbbrevCopyWith<$Res> {
  _$AbbrevCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pt = null,
    Object? en = null,
  }) {
    return _then(_value.copyWith(
      pt: null == pt
          ? _value.pt
          : pt // ignore: cast_nullable_to_non_nullable
              as String,
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AbbrevCopyWith<$Res> implements $AbbrevCopyWith<$Res> {
  factory _$$_AbbrevCopyWith(_$_Abbrev value, $Res Function(_$_Abbrev) then) =
      __$$_AbbrevCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pt, String en});
}

/// @nodoc
class __$$_AbbrevCopyWithImpl<$Res>
    extends _$AbbrevCopyWithImpl<$Res, _$_Abbrev>
    implements _$$_AbbrevCopyWith<$Res> {
  __$$_AbbrevCopyWithImpl(_$_Abbrev _value, $Res Function(_$_Abbrev) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pt = null,
    Object? en = null,
  }) {
    return _then(_$_Abbrev(
      pt: null == pt
          ? _value.pt
          : pt // ignore: cast_nullable_to_non_nullable
              as String,
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Abbrev implements _Abbrev {
  const _$_Abbrev({required this.pt, required this.en});

  factory _$_Abbrev.fromJson(Map<String, dynamic> json) =>
      _$$_AbbrevFromJson(json);

  @override
  final String pt;
  @override
  final String en;

  @override
  String toString() {
    return 'Abbrev(pt: $pt, en: $en)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Abbrev &&
            (identical(other.pt, pt) || other.pt == pt) &&
            (identical(other.en, en) || other.en == en));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pt, en);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AbbrevCopyWith<_$_Abbrev> get copyWith =>
      __$$_AbbrevCopyWithImpl<_$_Abbrev>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AbbrevToJson(
      this,
    );
  }
}

abstract class _Abbrev implements Abbrev {
  const factory _Abbrev({required final String pt, required final String en}) =
      _$_Abbrev;

  factory _Abbrev.fromJson(Map<String, dynamic> json) = _$_Abbrev.fromJson;

  @override
  String get pt;
  @override
  String get en;
  @override
  @JsonKey(ignore: true)
  _$$_AbbrevCopyWith<_$_Abbrev> get copyWith =>
      throw _privateConstructorUsedError;
}
