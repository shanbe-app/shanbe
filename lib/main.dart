import 'package:client/shanbe_app.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.production;
  WidgetsFlutterBinding.ensureInitialized();
  windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow(
      const WindowOptions(
          alwaysOnTop: true,
          skipTaskbar: false,
          title: 'Shanbe',
          size: Constants.DEFAULT_WINDOW_SIZE,
          maximumSize: Size.infinite,
          minimumSize: Constants.MIN_WINDOW_SIZE), () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const ShanbeApp());
}
