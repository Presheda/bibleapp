import 'package:path_provider/path_provider.dart';

// class PathProviderService {
//   PathProviderService._();
//
//   static String? _path;
//
//   static PathProviderService? instance;
//
//   factory PathProviderService() => instance ?? PathProviderService._();
//
//   String get path {
//     if (_path != null) {
//       return _path!;
//     } else {
//       throw Exception('Path not initialized');
//     }
//   }
//
//   Future<void> init() async {
//     final dir = await getApplicationDocumentsDirectory();
//     _path = dir.path;
//   }
// }



class PathProviderService {
  PathProviderService._();

  static String? _path;

  static String get path {
    if (_path != null) {
      return _path!;
    } else {
      throw Exception('Path not initialized');
    }
  }

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _path = dir.path;
  }
}
