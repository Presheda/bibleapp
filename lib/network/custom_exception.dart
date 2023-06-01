// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

enum _ExceptionType {
  TokenExpiredException,

  CancelException,
  ConnectTimeoutException,
  SendTimeoutException,
  ReceiveTimeoutException,
  SocketException,
  FetchDataException,
  FormatException,
  UnrecognizedException,
  ApiException,
  SerializationException,
}

class CustomException implements Exception {
  final String name, message;
  final String? code;
  final int? statusCode;
  final _ExceptionType exceptionType;

  CustomException(
      {required this.message,
      this.code,
      int? statusCode,
      this.exceptionType = _ExceptionType.ApiException})
      : statusCode = statusCode ?? 500,
        name = exceptionType.name;

  factory CustomException.fromDioException(Exception error) {
    try {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.cancel:
            return CustomException(
              exceptionType: _ExceptionType.CancelException,
              statusCode: error.response?.statusCode,
              message: "Request cancelled prematurely",
            );

          case DioErrorType.connectionTimeout:
            return CustomException(
              message: "Connection not established",
              exceptionType: _ExceptionType.ConnectTimeoutException,
              statusCode: error.response?.statusCode,
            );

          case DioErrorType.sendTimeout:
            return CustomException(
              message: "Failed to send",
              exceptionType: _ExceptionType.SendTimeoutException,
              statusCode: error.response?.statusCode,
            );

          case DioErrorType.receiveTimeout:
            return CustomException(
              message: "Fail to receive",
              exceptionType: _ExceptionType.ReceiveTimeoutException,
              statusCode: error.response?.statusCode,
            );

          case DioErrorType.badResponse:
          case DioErrorType.connectionError:
            if (error.message!.contains(_ExceptionType.SocketException.name)) {
              return CustomException(
                message: "No internet connectivity",
                exceptionType: _ExceptionType.FetchDataException,
                statusCode: error.response?.statusCode,
              );
            }

            if (error.response?.data["headers"]["code"] == null) {
              return CustomException(
                exceptionType: _ExceptionType.UnrecognizedException,
                statusCode: error.response?.statusCode,
                message: error.response?.statusMessage ?? "Unknown",
              );
            }

            final name = error.response?.data['headers']['code'] as String;

            final message =
                error.response?.data['headers']['message'] as String;
            if (name == _ExceptionType.TokenExpiredException.name) {
              return CustomException(
                message: message,
                code: name,
                exceptionType: _ExceptionType.TokenExpiredException,
                statusCode: error.response?.statusCode,
              );
            }

            return CustomException(
              message: message,
              code: name,
              statusCode: error.response?.statusCode,
            );

          default:
            return CustomException(
              exceptionType: _ExceptionType.UnrecognizedException,
              message: 'Error unrecognized',
            );
        }
      } else {
        return CustomException(
          exceptionType: _ExceptionType.UnrecognizedException,
          message: 'Error unrecognized',
        );
      }
    } on FormatException catch (e) {
      return CustomException(
        exceptionType: _ExceptionType.FormatException,
        message: e.message,
      );
    } on Exception catch (_) {
      return CustomException(
        exceptionType: _ExceptionType.UnrecognizedException,
        message: 'Error unrecognized',
      );
    }
  }

  factory CustomException.fromParsingException(Exception error) {
    debugPrint("error");
    return CustomException(
        message: "Unable to parse data",
        exceptionType: _ExceptionType.SerializationException);
  }
}
