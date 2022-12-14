import 'package:client/rx/services/app_info_service.dart';
import 'package:client/rx/services/connectivity_service.dart';
import 'package:client/rx/managers/emoji_manager.dart';
import 'package:client/rx/services/firebase_service.dart';
import 'package:client/rx/services/notification_service.dart';
import 'package:client/rx/services/rx_service.dart';
import 'package:client/rx/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ServiceProvider extends RxService {
  late final AppInfoService appInfoService;
  late final ConnectivityService connectivityService;
  late final NotificationService notificationService;
  late final StorageService storageService;
  late final FirebaseService firebaseService;
  late final EmojiManager emojiManager;
  Function? themeChangeCallback;
  Function? localeChangeCallback;

  ServiceProvider() {
    appInfoService = AppInfoService();
    connectivityService = ConnectivityService();
    notificationService = NotificationService();
    storageService = StorageService();
    firebaseService = FirebaseService();
    emojiManager = EmojiManager();
  }

  @override
  Future<void> onCreate() async {
    try {
      await appInfoService.onCreate();
      await connectivityService.onCreate();
      await notificationService.onCreate();
      await storageService.onCreate();
      await firebaseService.onCreate();
    } catch (e) {
      print('error');
      print(e);
    }
    _registerSingleton();
  }

  @override
  Future<void> onTerminate() async {
    await appInfoService.onTerminate();
    await connectivityService.onTerminate();
    await notificationService.onTerminate();
    await storageService.onTerminate();
    await firebaseService.onTerminate();
  }

  void _registerSingleton() {
    GetIt.I
        .registerSingleton<ServiceProvider>(this, instanceName: 'appService');
  }

  static ServiceProvider getInstance() =>
      GetIt.I.get<ServiceProvider>(instanceName: 'appService');

  void setThemeChangeListener(Function(ThemeMode theme) callback) =>
      themeChangeCallback = callback;

  void setLocaleChangeListener(Function(Locale theme) callback) =>
      localeChangeCallback = callback;
}
