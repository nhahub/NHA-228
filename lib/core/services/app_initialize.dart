import 'package:firebase_core/firebase_core.dart';
import 'package:nha_228/core/services/hive_service.dart';
import 'package:nha_228/firebase_options.dart';

class AppInitialize {
  static final AppInitialize _instance = AppInitialize._intrnal();
  factory AppInitialize() {
    return _instance;
  }
  AppInitialize._intrnal();
  intializrStings() async {
    await Future.wait<dynamic>([_instanceializeHive(), _instanceializeFirebase()]);
  }

  _instanceializeHive() async {
    await HiveManager().init();
  }

  _instanceializeFirebase() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
}
