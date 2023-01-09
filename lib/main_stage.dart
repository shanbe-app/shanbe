import 'package:flutter/material.dart';

import 'flavors.dart';
import 'shanbe_app.dart';

void main() {
  F.appFlavor = Flavor.stage;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ShanbeApp());
}
