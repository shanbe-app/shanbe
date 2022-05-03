import 'package:flutter/cupertino.dart';

String languageCodeFromLocaleName(String localeName) =>
    localeName.split('_').first;
String countryFromLocaleName(String localeName) =>
    localeName.split('_').last;

bool isAndroid(TargetPlatform platform) => platform == TargetPlatform.android;
bool isIos(TargetPlatform platform) => platform == TargetPlatform.iOS;