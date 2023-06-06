import 'package:bibleapp/helpers/typedefs.dart';
import 'package:bibleapp/network/api_interface.dart';
import 'package:bibleapp/network/custom_exception.dart';
import 'package:bibleapp/network/response_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/cancel_token.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';

import 'dio_service.dart';

class ApiService implements ApiInterface {
  late final DioService _dioService;

  ApiService(DioService dioService) : _dioService = dioService;

  @override
  Future<List<T>> getCollectionData<T>(
      {required String endpoint,
      JSON? queryParams,
      CancelToken? cancelToken,
      bool requiresAuthToken = true,
      CachePolicy? cachePolicy,
      int? cacheAgeDays,
      required T Function(JSON responseBody) converter}) async {
    List<Object?> body;

    try {
      final data = await _dioService.get(
          endpoint: endpoint,
          cacheOptions: _dioService.globalCacheOptions?.copyWith(
              policy: cachePolicy,
              maxStale: cacheAgeDays != null
                  ? Nullable(Duration(days: cacheAgeDays))
                  : null),
          options: Options(extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          }),
          queryParams: queryParams,
          cancelToken: cancelToken);

      body = data.data;
    } on Exception catch (ex) {
      debugPrint("data here is $ex");
      throw CustomException.fromDioException(ex);
    }

    try {
      return body.map((dataMap) => converter(dataMap! as JSON)).toList();
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<T> getDocumentData<T>(
      {required String endpoint,
      JSON? queryParams,
      CancelToken? cancelToken,
      CachePolicy? cachePolicy,
      int? cacheAgeDays,
      bool requiresAuthToken = true,
      required T Function(JSON responseBody) converter}) async {
    JSON body;

    try {
      final response = await _dioService.get(
          endpoint: endpoint,
          cancelToken: cancelToken,
          queryParams: queryParams,
          cacheOptions: _dioService.globalCacheOptions?.copyWith(
            policy: cachePolicy,
            maxStale: cacheAgeDays != null
                ? Nullable(Duration(days: cacheAgeDays))
                : null,
          ),
          options: Options(extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken
          }));
      body = response.data;
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      return converter(body);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<T> setData<T>(
      {required String endpoint,
      required JSON data,
      CancelToken? cancelToken,
      bool requiresAuthToken = true,
      required T Function(ResponseModel<JSON> response) converter}) async {
    ResponseModel<JSON> responseModel;

    try {
      responseModel = await _dioService.post(
          endpoint: endpoint,
          data: data,
          options: Options(
              extra: <String, Object?>{"requiresAuthToken": requiresAuthToken}),
          cancelToken: cancelToken);
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      return converter(responseModel);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<T> updateData<T>(
      {required String endpoint,
      required JSON data,
      CancelToken? cancelToken,
      bool requiresAuthToken = true,
      required T Function(ResponseModel<JSON> response) converter}) async {
    ResponseModel<JSON> response;

    try {
      response = await _dioService.patch<JSON>(
          endpoint: endpoint,
          cancelToken: cancelToken,
          data: data,
          options: Options(extra: <String, Object?>{
            "requiresAuthToken": requiresAuthToken
          }));
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      return converter(response);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<T> deleteData<T>(
      {required String endpoint,
      JSON? data,
      CancelToken? cancelToken,
      bool requiresAuthToken = true,
      required T Function(ResponseModel<JSON> response) converter}) async {
    ResponseModel<JSON> response;

    try {
      response = await _dioService.delete<JSON>(
          endpoint: endpoint,
          cancelToken: cancelToken,
          data: data,
          options: Options(extra: <String, Object?>{
            "requiresAuthToken": requiresAuthToken
          }));
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      return converter(response);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequest(cancelToken: cancelToken);
  }
}
