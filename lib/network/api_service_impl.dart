import 'api_service.dart';
import 'package:bibleapp/network/api_service.dart';
import 'package:dio/dio.dart';
import 'package:bibleapp/network/api_endpoint.dart';
import 'package:bibleapp/network/dio_service.dart';
import 'package:bibleapp/network/interceptors/api_interceptor.dart';
import 'package:bibleapp/network/interceptors/logging_interceptor.dart';
import 'package:bibleapp/network/interceptors/refresh_token_interceptor.dart';
import 'package:bibleapp/storage/path_provider.dart';

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';

class ApiServiceImpl {
  static ApiService? _apiService;

  ApiServiceImpl._();

  static void initializeApiService() {
    if (_apiService != null) return;

    final baseOptions = BaseOptions(
      baseUrl: ApiEndpoint.baseUrl,
    );

    final _cacheOptions = CacheOptions(
      store: HiveCacheStore(PathProviderService.path,
          hiveBoxName: "deggia_dio_cache"),
      policy:
          CachePolicy.noCache, // Bcz we force cache on-demand in repositories
      maxStale: const Duration(days: 30), // No of days cache is valid
      keyBuilder: (options) => options.path,
    );

    final _dio = Dio(baseOptions);
    DioService dioService = DioService(
      dioClient: _dio,
      globalCacheOptions: _cacheOptions,
      interceptors: [
        // Order of interceptors very important
        ApiInterceptor(),
        DioCacheInterceptor(options: _cacheOptions),
        if (kDebugMode) LoggingInterceptor(),
        RefreshTokenInterceptor(dioClient: _dio)
      ],
    );

    _apiService = ApiService(dioService);
    return;
  }

  static ApiService getApiService() {
    return _apiService!;
  }
}
