import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: ".env")
abstract class Env {
  @EnviedField(varName: 'BIBLE_API_KEY', obfuscate: true)
  static final String BIBLE_API_KEY = _Env.BIBLE_API_KEY;
}
