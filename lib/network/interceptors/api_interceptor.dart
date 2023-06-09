import 'package:bibleapp/network/config.dart';
import 'package:bibleapp/storage/env.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  static const String requiresAuthTokenKey = "requiresAuthToken";



  ApiInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.extra.containsKey(requiresAuthTokenKey)) {
      if (options.extra[requiresAuthTokenKey] == true) {
        //TODO if the app consumes multiple apis, then there write logic to check base
        //TODO URL and add appropriate header key
        final token = Env.BIBLE_API_KEY;


        options.headers.addAll(
          <String, Object?>{
            'api-key': token,
          },
        );
      }
      options.extra.remove(requiresAuthTokenKey);
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO this depends on the APi and it's formate of how errors are returned
    final success = response.statusCode == 200;

    if (success) return handler.next(response);

    return handler.reject(
        DioError(requestOptions: response.requestOptions, response: response));
  }

}
