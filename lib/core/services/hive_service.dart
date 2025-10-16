import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:nha_228/features/auth/models/user_model.dart';

class HiveManager {
  static final HiveManager _instance = HiveManager._internal();

  factory HiveManager() {
    return _instance;
  }

  HiveManager._internal();

  late Box _box;
  late Box<UserModel> _userBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    _box = await Hive.openBox('app_box');
    _userBox = await Hive.openBox<UserModel>('user_box');
  }

  Future<void> setBool(String key, bool value) async {
    await _box.put(key, value);
  }

  bool getBool(String key) {
    return _box.get(key, defaultValue: false) as bool;
  }

  Future<void> saveUser(UserModel user) async {
    await _userBox.put('user', user);
  }

  UserModel? getUser() {
    return _userBox.get('user');
  }

  Future<void> clearUser() async {
    await _userBox.delete('user');
  }
}