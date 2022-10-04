import 'dart:convert';
import 'dart:math';

import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

String languageCodeFromLocaleName(String localeName) =>
    localeName.split('_').first;

String countryFromLocaleName(String localeName) => localeName.split('_').last;

bool isAndroid(TargetPlatform platform) => platform == TargetPlatform.android;

bool isIos(TargetPlatform platform) => platform == TargetPlatform.iOS;

bool strNotEmpty(String? str) {
  return !strEmpty(str);
}

bool strEmpty(String? str) {
  return str == null || str.isEmpty;
}

String randString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

String toSHA256(String input) {
  var bytes = utf8.encode(input);
  var digest = sha256.convert(bytes);
  return digest.toString();
}

String timeTo2Digit(int? digit) {
  if (digit == null) return '';
  if (digit.toString().length == 1) {
    return '0$digit';
  } else {
    return digit.toString();
  }
}

TextDirection correctDirection(String input) {
  return input.startsWith(RegExp(r'[A-Za-z0-9]'))
      ? TextDirection.ltr
      : TextDirection.rtl;
}

TextAlign correctAlignment(String input) {
  return input.startsWith(RegExp(r'[A-Za-z0-9]'))
      ? TextAlign.left
      : TextAlign.right;
}

String currentLocale(BuildContext context) {
  return Localizations.localeOf(context).languageCode;
}

bool isRtl(BuildContext context) {
  return currentLocale(context) == 'fa' ? true : false;
}

T? firstOrNull<T>(Iterable<T> items, callback) {
  try {
    return items.firstWhere(callback);
  } catch (e) {
    return null;
  }
}

Brightness themeModeToBrightness(ThemeMode themeMode) {
  switch (themeMode) {
    case ThemeMode.light:
      return Brightness.light;
    case ThemeMode.dark:
      return Brightness.dark;
    case ThemeMode.system:
      return WidgetsBinding.instance.window.platformBrightness;
  }
}

void showPlatformActionSheet<T>(
    {required BuildContext context,
    required List<T> items,
    required Stream<T> value,
    required Function(T) onSelect,
    required Function(T) translateItem,
    required String title,
    required String cancelText}) {
  if (isCupertino(context)) {
    showCupertinoModalPopup(
        context: context,
        barrierColor: Constants.BARRIER_COLOR,
        barrierDismissible: true,
        builder: (context) => CupertinoActionSheet(
              title: Text(title),
              actions: items
                  .map((e) => CupertinoActionSheetAction(
                      onPressed: () {
                        onSelect(e);
                        Navigator.pop(context);
                      },
                      child: Text(translateItem(e))))
                  .toList(),
            ));
  } else {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      cancelText,
                    ))
                //  where is ol button?
              ],
              contentPadding: const EdgeInsets.only(top: 16),
              content: StreamBuilder(
                stream: value,
                builder: (context, snapshot) {
                  T? val = snapshot.data as T?;
                  if (val == null) return Container();
                  return ListView(
                    shrinkWrap: true,
                    children: items
                        .map((e) => RadioListTile(
                              onChanged: (_) {
                                onSelect(e);
                                Navigator.pop(context);
                              },
                              groupValue: val.toString(),
                              title: Text(translateItem(e)),
                              value: e.toString(),
                            ))
                        .toList(),
                  );
                },
              ),
            ));
  }
}

void showPlatformContentSheet<T>(
    {required BuildContext context, required WidgetBuilder builder}) {
  if (isCupertino(context)) {
    showCupertinoModalBottomSheet(
        context: context,
        expand: false,
        isDismissible: true,
        useRootNavigator: true,
        enableDrag: true,
        backgroundColor: modalSheetBackgroundColor(context),
        barrierColor: Constants.BARRIER_COLOR,
        topRadius: const Radius.circular(24),
        builder: builder);
  } else {
    showMaterialModalBottomSheet(
        barrierColor: Constants.BARRIER_COLOR,
        backgroundColor: modalSheetBackgroundColor(context),
        useRootNavigator: true,
        isDismissible: true,
        expand: false,
        context: context,
        builder: builder);
  }
}
