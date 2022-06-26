import 'dart:io';

import 'package:client/rx/services/amplify_service.dart';
import 'package:client/rx/services/app_info_service.dart';
import 'package:client/rx/services/background_service.dart';
import 'package:client/rx/services/connectivity_service.dart';
import 'package:client/rx/services/firebase_service.dart';
import 'package:client/rx/services/notification_service.dart';
import 'package:client/rx/services/rx_service.dart';
import 'package:client/rx/services/storage_service.dart';
import 'package:get_it/get_it.dart';

class AppService extends RxService {
  late final AppInfoService appInfoService;
  late final ConnectivityService connectivityService;
  late final NotificationService notificationService;
  late final StorageService storageService;
  late final FirebaseService firebaseService;
  late final AmplifyService amplifyService;
  late final BackgroundService backgroundService;

  AppService() {
    appInfoService = AppInfoService();
    connectivityService = ConnectivityService();
    notificationService = NotificationService();
    storageService = StorageService();
    firebaseService = FirebaseService();
    amplifyService = AmplifyService();
    backgroundService = BackgroundService();
  }

  @override
  Future<void> onCreate() async {
    _registerSingleton();
    await appInfoService.onCreate();
    await amplifyService.onCreate();
    await connectivityService.onCreate();
    await notificationService.onCreate();
    await storageService.onCreate();
    await firebaseService.onCreate();
    await backgroundService.onCreate();
    print('call register');
  }

  @override
  Future<void> onTerminate() async {
    await appInfoService.onTerminate();
    await amplifyService.onTerminate();
    await connectivityService.onTerminate();
    await notificationService.onTerminate();
    await storageService.onTerminate();
    await firebaseService.onTerminate();
    await backgroundService.onTerminate();
  }

  void _registerSingleton() {
    GetIt.I.registerSingleton<AppService>(this, instanceName: 'appService');
  }
  static AppService getInstance() =>
      GetIt.I.get<AppService>(instanceName: 'appService');
}
