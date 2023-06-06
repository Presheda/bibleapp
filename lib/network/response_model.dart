// ignore_for_file: library_private_types_in_public_api

import 'package:bibleapp/helpers/typedefs.dart';

class ResponseModel<T> {
  final _ResponseModelHeadersModel headers;
  final T data;

  const ResponseModel({required this.headers, required this.data});

  factory ResponseModel.fromJson(JSON json) {
    return ResponseModel(
        headers: _ResponseModelHeadersModel.fromJson(json['headers'] as JSON),
        data: json['data'] as T);
  }
}

class _ResponseModelHeadersModel {
  final bool error;
  final String message;
  final String? code;

  const _ResponseModelHeadersModel(
      {required this.error, required this.message, this.code});

  factory _ResponseModelHeadersModel.fromJson(JSON json) {
    return _ResponseModelHeadersModel(
        error: (json['error'] as int) == 1,
        message: json['message'] as String,
        code: json['code'] as String);
  }
}
