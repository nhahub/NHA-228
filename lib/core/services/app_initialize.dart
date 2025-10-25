import 'package:firebase_core/firebase_core.dart';
import 'package:nha_228/core/services/hive_service.dart';
import 'package:nha_228/firebase_options.dart';

class AppInitialize {
  static final AppInitialize _instance = AppInitialize._internal();

  factory AppInitialize() {
    return _instance;
  }

  AppInitialize._internal();

  initializeSettings() async {
    await Future.wait<dynamic>([_initializeFirebase(), _initializeHive()]);
  }

  _initializeFirebase() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }

  _initializeHive() async {
    await HiveManager().init();
  }
}
