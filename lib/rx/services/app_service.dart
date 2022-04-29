import 'package:client/rx/services/app_info_service.dart';
import 'package:client/rx/services/attachment_service.dart';
import 'package:client/rx/services/auth_service.dart';
import 'package:client/rx/services/connectivity_service.dart';
import 'package:client/rx/services/notification_service.dart';
import 'package:client/rx/services/rx_service.dart';
import 'package:client/rx/services/storage_service.dart';


class AppService extends RxService {
  late AppInfoService appInfoService;
  late AttachmentService attachmentService;
  late AuthService authService;
  late ConnectivityService connectivityService;
  late NotificationService notificationService;
  late StorageService storageService;

  AppService() {
    appInfoService = AppInfoService();
    attachmentService = AttachmentService();
    authService = AuthService();
    connectivityService = ConnectivityService();
    notificationService = NotificationService();
    storageService = StorageService();
  }
  @override
  Future<void> onCreate() async{
    await appInfoService.onCreate();
    await attachmentService.onCreate();
    await authService.onCreate();
    await connectivityService.onCreate();
    await notificationService.onCreate();
    await storageService.onCreate();
  }
  @override
  Future<void> onTerminate() async {
    await appInfoService.onTerminate();
    await attachmentService.onTerminate();
    await authService.onTerminate();
    await connectivityService.onTerminate();
    await notificationService.onTerminate();
    await storageService.onTerminate();
  }
}