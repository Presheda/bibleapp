import 'dart:async' ;

import 'dart:core';

import 'package:bibleapp/helpers/typedefs.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';

import 'response_model.dart';

class DioService {
  final Dio _dio;

  final CacheOptions? globalCacheOptions;

  final CancelToken _cancelToken;

  DioService(
      {required Dio dioClient,
      this.globalCacheOptions,
      Iterable<Interceptor>? interceptors,
      HttpClientAdapter? httpClientAdapter})
      : _dio = dioClient,
        _cancelToken = CancelToken() {
    if (interceptors != null) _dio.interceptors.addAll(interceptors);
    if (httpClientAdapter != null) _dio.httpClientAdapter = httpClientAdapter;
  }

  void cancelRequest({CancelToken? cancelToken}) {
    if (cancelToken == null) {
      _cancelToken.cancel("Cancelled");
    } else {
      cancelToken.cancel();
    }
  }

  Future<dynamic> get({
    required String endpoint,
    JSON? queryParams,
    Options? options,
    CacheOptions? cacheOptions,
    CancelToken? cancelToken,
  }) async {

    debugPrint("query is ${queryParams}");

    final response = await _dio.get<dynamic>(endpoint,
        queryParameters: queryParams,
        options: _mergeDioAndCacheOptions(
            dioOptions: options, cacheOptions: cacheOptions),
        cancelToken: cancelToken ?? _cancelToken);

    return response;
  }

  Future<dynamic> post({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.post<dynamic>(endpoint,
        data: data, cancelToken: cancelToken ?? _cancelToken, options: options);

    return response;
  }

  Future<dynamic> patch<R>({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.patch(endpoint,
        data: data, options: options, cancelToken: cancelToken ?? _cancelToken);

    return response;
  }

  Future<dynamic> delete<R>(
      {required String endpoint,
      JSON? data,
      Options? options,
      CancelToken? cancelToken}) async {
    final response = await _dio.delete(endpoint,
        options: options, cancelToken: cancelToken ?? _cancelToken);

    return response;
  }

  Options? _mergeDioAndCacheOptions({
    Options? dioOptions,
    CacheOptions? cacheOptions,
  }) {
    if (dioOptions == null && cacheOptions == null) {
      return null;
    }

    if (dioOptions == null && cacheOptions != null) {
      return cacheOptions.toOptions();
    }

    if (dioOptions != null && cacheOptions == null) {
      return dioOptions;
    }
    final _cacheOptionsMap = cacheOptions!.toExtra();
    final options = dioOptions!.copyWith(
        extra: <String, dynamic>{...dioOptions.extra!, ..._cacheOptionsMap});
    return options;
  }
}
