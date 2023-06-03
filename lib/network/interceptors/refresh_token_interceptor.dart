import 'package:bibleapp/helpers/typedefs.dart';
import 'package:dio/dio.dart';

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

        final code =  headers['code'] as String;

        if(code == TokenExpiredException){
          final tokenDio = Dio()..options =_dio.options;

          _dio.close()
        }

      }
    }
  }
}
