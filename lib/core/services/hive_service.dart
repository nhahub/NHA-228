import 'package:hive_ce_flutter/adapters.dart';
import 'package:nha_228/features/auth/models/user_model.dart';

class HiveManager {
  static final HiveManager _instance = HiveManager._internal();

  factory HiveManager() {
    return _instance;
  }

  HiveManager._internal();

  late Box _box;
  late Box _userBox;

  init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    _box = await Hive.openBox('app_box');
    _userBox = await Hive.openBox('user_box');
  }

  Future<void> setBool(String key, bool value) async {
    await _box.put(key, value);
  }

   bool getBool<bool>(String key){
   return _box.get(key)?? false;
   }
   Future<void> saveUser(UserModel user)async {
    await _userBox.put('user', user.toMap());
   }
   UserModel? getUser(){
    final data = _userBox.get('user');
    if (data == null) return null;
    return UserModel.fromMap(Map<String, dynamic>.from(data));
   }
   Future<void> clearUser() async{
    await _userBox.delete('user');
   }
   
 
}
