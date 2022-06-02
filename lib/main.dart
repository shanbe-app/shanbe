import 'package:client/shanbe_app.dart';
import 'package:flutter/material.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.production;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ShanbeApp());
}
