import 'package:client/rx/services/rx_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoService extends RxService {
  late PackageInfo packageInfo;
  AppInfoService();

  @override
  Future<void> onCreate() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  Future<void> onTerminate() async {}
}