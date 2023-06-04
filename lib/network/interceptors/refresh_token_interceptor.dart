import 'package:bibleapp/helpers/typedefs.dart';
import 'package:bibleapp/network/api_endpoint.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio _dio;
  RefreshTokenInterceptor({
    required Dio dioClient,
  }) : _dio = dioClient;

  String get TokenExpiredException => "TokenExpiredException";

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      if (err.response!.data != null) {
        final headers = err.response!.data['headers'] as JSON;

        final code = headers['code'] as String;

        if (code == TokenExpiredException) {
          final tokenDio = Dio()..options = _dio.options;

          final token = await _refreshTokenRequest(
              dioError: err, handler: handler, tokenDio: tokenDio);

          //TODO make sure to store the new token in secure storage

          if (token != null) {
            final response = await _dio.request<JSON>(
              err.requestOptions.path,
              data: err.requestOptions.data,
              cancelToken: err.requestOptions.cancelToken,
              options: Options(
                headers: <String, Object?>{'Authorization': 'Bearer $token'},
              ),
            );
            return handler.resolve(response);
          }
        }
      }
    }
    return super.onError(err, handler);
  }

  Future<String?> _refreshTokenRequest({
    required DioError dioError,
    required ErrorInterceptorHandler handler,
    required Dio tokenDio,
  }) async {
    /// here we are going to send some data about this user to the backend to help us
    /// generate a new authToke
    /// data typically includes [password], [email], [uniquId]
    Map<String, Object?> data = {
      'erp': "", //TODO get the user password from secure storage,,
      'password': "", //TODO get the user password from secure storage,
      'some_other': "" //TODO get the user password from secure storage,
    };

    try {
      debugPrint('');

      final response = await tokenDio.post<JSON>(
        ApiEndpoint.books(BooksEndpoint.BOOKS),
        data: data,
      );

      // Check new token success
      final success = response.data?['headers']['error'] == 0;

      if (success) {
        debugPrint('<-- END REFRESH');
        return response.data?['body']['token'] as String;
      } else {
        throw Exception(response.data?['headers']['message']);
      }
    } on Exception catch (ex) {
      // only caught here for logging
      // forward to try-catch in dio_service for handling
      debugPrint('\t--> ERROR');
      if (ex is DioError) {
        final de = ex;
        debugPrint('\t\t--> Exception: ${de.error}');
        debugPrint('\t\t--> Message: ${de.message}');
        debugPrint('\t\t--> Response: ${de.response}');
      } else {
        debugPrint('\t\t--> Exception: $ex');
      }
      debugPrint('\t<-- END ERROR');
      debugPrint('<-- END REFRESH');

      return null;
    }
  }
}
