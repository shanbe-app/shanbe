import 'package:client/rx/services/amplify_service.dart';
import 'package:client/rx/services/app_info_service.dart';
import 'package:client/rx/services/connectivity_service.dart';
import 'package:client/rx/services/firebase_service.dart';
import 'package:client/rx/services/notification_service.dart';
import 'package:client/rx/services/rx_service.dart';
import 'package:client/rx/services/storage_service.dart';

class AppService extends RxService {
  late AppInfoService appInfoService;
  late ConnectivityService connectivityService;
  late NotificationService notificationService;
  late StorageService storageService;
  late FirebaseService firebaseService;
  late AmplifyService amplifyService;

  AppService() {
    appInfoService = AppInfoService();
    connectivityService = ConnectivityService();
    notificationService = NotificationService();
    storageService = StorageService();
    firebaseService = FirebaseService();
    amplifyService = AmplifyService();
  }

  @override
  Future<void> onCreate() async {
    await appInfoService.onCreate();
    await amplifyService.onCreate();
    await connectivityService.onCreate();
    await notificationService.onCreate();
    await storageService.onCreate();
    await firebaseService.onCreate();
  }

  @override
  Future<void> onTerminate() async {
    await appInfoService.onTerminate();
    await amplifyService.onTerminate();
    await connectivityService.onTerminate();
    await notificationService.onTerminate();
    await storageService.onTerminate();
    await firebaseService.onTerminate();
  }
}
