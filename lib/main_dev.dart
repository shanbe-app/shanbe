import 'package:flutter/material.dart';
import 'shanbe_app.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.dev;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ShanbeApp());
}
