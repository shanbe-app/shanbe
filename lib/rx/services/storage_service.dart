import 'package:client/rx/services/rx_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends RxService {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  late SharedPreferences sharedPreferences;

  @override
  Future<void> onCreate() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> onTerminate() async {}
}
