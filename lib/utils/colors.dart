import 'dart:io';

import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

Color headingColor(BuildContext context) {
  return isDark(context)
      ? Constants.TEXT_BLACK_COLOR_DARK
      : Constants.TEXT_BLACK_COLOR;
}

Color textColor(BuildContext context) {
  return isDark(context)
      ? Constants.TEXT_BODY_COLOR_DARK
      : Constants.TEXT_BODY_COLOR;
}

Color secondaryTextColor(BuildContext context) {
  return isDark(context)
      ? Constants.TEXT_LABEL_COLOR_DARK
      : Constants.TEXT_LABEL_COLOR;
}

Color dividerColor(BuildContext context) {
  return isDark(context) ? Constants.LINE_COLOR_DARK : Constants.LINE_COLOR;
}

Color grayColor(BuildContext context) {
  return isDark(context) ? Constants.GRAY_COLOR_DARK : Constants.GRAY_COLOR;
}

Color grayLighterColor(BuildContext context) {
  return isDark(context)
      ? Constants.GRAY_LIGHTER_COLOR_DARK
      : Constants.GRAY_LIGHTER_COLOR;
}

Color backgroundColor(BuildContext context) {
  return isDark(context)
      ? Constants.BACKGROUND_COLOR_DARK
      : Constants.BACKGROUND_COLOR;
}

Color placeholderColor(BuildContext context) {
  return isDark(context)
      ? Constants.PLACEHOLDER_COLOR_DARK
      : Constants.PLACEHOLDER_COLOR;
}

Color appbarBackIconColor(BuildContext context) {
  return isDark(context) ? Colors.white : Colors.black;
}

bool isDark(BuildContext context) {
  if (Platform.isIOS) {
    CupertinoTheme.of(context).brightness == Brightness.dark;
  } else if (Platform.isMacOS) {
    return MacosTheme.of(context).brightness.isDark;
  }
  return Theme.of(context).brightness == Brightness.dark;
}

Color inputBackgroundColor(BuildContext context) {
  return isDark(context)
      ? Constants.INPUT_BACKGROUND_COLOR_DARK
      : Constants.INPUT_BACKGROUND_COLOR;
}

Color modalSheetBackgroundColor(BuildContext context) {
  return isDark(context)
      ? Constants.BACKGROUND_COLOR_MODAL_SHEET_DARK
      : Constants.BACKGROUND_COLOR_MODAL_SHEET;
}
