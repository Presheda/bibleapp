import 'package:bibleapp/storage/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorageBase {
  static  SharedPreferences? _sharedPreferences;
  static  FlutterSecureStorage? _secureStorage;

  static KeyValueStorageBase? _instance;

  factory KeyValueStorageBase() => _instance ?? const KeyValueStorageBase._();
  const KeyValueStorageBase._();

  static Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    _secureStorage ??= const FlutterSecureStorage();
  }

  T? getCommon<T>(String key) {

    try {
      switch (T) {
        case String:
          return _sharedPreferences!.getString(key) as T?;
        case int:
          return _sharedPreferences!.getInt(key) as T?;

        case bool:
          return _sharedPreferences!.getBool(key) as T?;

        case double:
          return _sharedPreferences!.getDouble(key) as T?;

        default:
          return _sharedPreferences!.get(key) as T?;
      }
    } on Exception catch (e) {
      return null;
    }
  }

  Future<String?> getEncrypted(String key) async {
    try {
      return _secureStorage!.read(key: key);
    } on PlatformException catch (e) {
      return null;
    }
  }

  Future<bool> setCommon<T>(String key, T value) async {
    switch (T) {
      case String:
        return _sharedPreferences!.setString(key, value as String);
      case int:
        return _sharedPreferences!.setInt(key, value as int);
      case bool:
        return _sharedPreferences!.setBool(key, value as bool);
      case double:
        return _sharedPreferences!.setDouble(key, value as double);
      default:
        return _sharedPreferences!.setString(key, value as String);
    }
  }

  Future<bool> setEncrypted(String key, String value) async {
    try {
      _secureStorage!.write(key: key, value: value);
      return true;
    } on PlatformException catch (ex) {
      debugPrint('$ex');
      return Future.value(false);
    }
  }

  Future<bool> clearCommon() => _sharedPreferences!.clear();

  Future<bool> clearEncrypted() async {
    try {
      await _secureStorage!.deleteAll();
      return true;
    } on PlatformException catch (ex) {
      return false;
    }
  }
}
