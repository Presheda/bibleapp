import 'key_value_storage_base.dart';

class KeyValueStorageService {
  static const _authTokenKey = "authToken";
  static const _authPasswordKey = "authPasswordKey";
  static const _authUserKey = "authUserKey";

  final _keyValueStorage = KeyValueStorageBase();

  Future<String> getAuthPassword() async {
    return await _keyValueStorage.getEncrypted(_authPasswordKey) ?? "";
  }

  Future<String> getAuthToken() async {
    return await _keyValueStorage.getEncrypted(_authTokenKey) ?? "";
  }

  void setAuthPassword(String password) {
    _keyValueStorage.setEncrypted(_authPasswordKey, password);
  }

  void setAuthToken(String token) {
    _keyValueStorage.setEncrypted(_authTokenKey, token);
  }

  void resetKeys() {
    _keyValueStorage
      ..clearCommon()
      ..clearEncrypted();
  }
}
