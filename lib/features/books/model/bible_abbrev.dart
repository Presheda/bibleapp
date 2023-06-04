import 'package:freezed_annotation/freezed_annotation.dart';



part 'bible_abbrev.freezed.dart';
part 'bible_abbrev.g.dart';

@freezed
class Abbrev with _$Abbrev {


  const factory Abbrev({
    required String pt,
    required String en,
  }) = _Abbrev;

  factory   Abbrev.fromJson(Map<String, Object?> json) => _$AbbrevFromJson(json);
}
