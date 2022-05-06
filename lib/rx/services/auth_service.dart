import 'dart:convert';

import 'package:client/flavors.dart';
import 'package:client/rx/services/rx_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class AuthService extends RxService {
  @override
  Future<void> onCreate() async {}

  @override
  Future<void> onTerminate() async {}
}
