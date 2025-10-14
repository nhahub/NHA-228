import 'package:hive_ce_flutter/adapters.dart';

class HiveManager {
  static final HiveManager _instance= HiveManager._internal();

  factory HiveManager(){
    return _instance;
  }

  HiveManager._internal();

  late Box _box;

  init ()async{
    await Hive.initFlutter();
    _box = await Hive.openBox('app_box');
  }

   Future<void> setBool(String key,bool value)async {
   await _box.put(key, value);
  }

   bool getBool<bool>(String key){
   return _box.get(key)?? false;
   }
   }
