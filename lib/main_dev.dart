import 'package:flutter/material.dart';
import 'shanbe_app.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.dev;
  runApp(const ShanbeApp());
}
