// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static const String ACCESS_TOKEN_PREFS = 'access_token';
  static const String REFRESH_TOKEN_PREFS = 'refresh_token';
  static const String SHOW_NOTIFICATIONS_PREFS = 'SHOW_NOTIFICATIONS_PREFS';

  static final Color PRIMARY_COLOR = Colors.blue.shade300;
  static final Color PRIMARY_COLOR_DARK = Colors.blue.shade500;
  static final Color PRIMARY_COLOR_LIGHT = Colors.blue.shade200;

  static final Color SECONDARY_COLOR = Colors.pink.shade300;
  static final Color SECONDARY_COLOR_DARK = Colors.pink.shade400;
  static final Color SECONDARY_COLOR_LIGHT = Colors.pink.shade200;

  static const Color ERROR_COLOR = Color.fromRGBO(237, 46, 126, 1);
  static const Color ERROR_COLOR_DARK = Color.fromRGBO(195, 0, 82, 1);
  static const Color ERROR_COLOR_LIGHT = Color.fromRGBO(255, 242, 247, 1);
  static const Color SUCCESS_COLOR = Color.fromRGBO(0, 186, 136, 1);
  static const Color WARNING_COLOR = Color.fromRGBO(244, 183, 64, 1);
  static const Color WARNING_COLOR_LIGHT = Color.fromRGBO(255, 240, 212, 1);
  static const Color WARNING_COLOR_DARK = Color.fromRGBO(162, 107, 0, 1);

  static const Color TEXT_BLACK_COLOR = Color.fromRGBO(20, 20, 43, 1);
  static const Color TEXT_BODY_COLOR = Color.fromRGBO(78, 75, 102, 1.0);
  static const Color TEXT_BODY_COLOR_DARK = Color.fromRGBO(203, 203, 203, 1);
  static const Color TEXT_LABEL_COLOR = Color.fromRGBO(110, 113, 145, 1);
  static const Color PLACEHOLDER_COLOR = Color.fromRGBO(160, 163, 189, 1);
  static const Color LINE_COLOR = Color.fromRGBO(214, 216, 231, 1);
  static const Color LINE_COLOR_DARK = Color.fromRGBO(41, 39, 24, 1);

  static const Color BACKGROUND_COLOR = Color.fromRGBO(239, 243, 247, 1.0);
  static const Color BACKGROUND_COLOR_DARK = Color.fromRGBO(16, 12, 8, 1);
  static const Color INPUT_BACKGROUND_COLOR = Color.fromRGBO(239, 240, 246, 1);

  static const double S2_FONT_SIZE = 12;
  static const double S1_FONT_SIZE = 16;
  static const double H6_FONT_SIZE = 18;
  static const double H5_FONT_SIZE = 21;
  static const double H4_FONT_SIZE = 24;
  static const double H3_FONT_SIZE = 28;
  static const double H2_FONT_SIZE = 31;
  static const double H1_FONT_SIZE = 34;
  static const FontWeight REGULAR_FONT_WEIGHT = FontWeight.w400;
  static const FontWeight MEDIUM_FONT_WEIGHT = FontWeight.w500;
  static const FontWeight DEMI_BOLD_FONT_WEIGHT = FontWeight.w600;
  static const FontWeight BOLD_FONT_WEIGHT = FontWeight.bold;
  static const String APPLICATION_DEFAULT_FONT = 'Graphik';
  static const List<String> APPLICATION_FALLBACK_FONTS = ['IranSans', 'Dana', 'sans-serif'];

  static const Duration SEARCH_INPUT_DEBOUNCE_DURATION = Duration(milliseconds: 250);
  static const EdgeInsets PAGE_PADDING = EdgeInsets.symmetric(horizontal: 16);


  static const List<List<Color>> AVATAR_GRADIENT_COLORS = [
    [
      Color.fromRGBO(255, 220, 228, 1),
      Color.fromRGBO(251, 187, 202, 1),
      Color.fromRGBO(170, 88, 107, 1)
    ],
    [
      Color.fromRGBO(255, 217, 200, 1),
      Color.fromRGBO(255, 191, 162, 1),
      Color.fromRGBO(158, 103, 77, 1)
    ],
    [
      Color.fromRGBO(255, 229, 168, 1),
      Color.fromRGBO(247, 206, 108, 1),
      Color.fromRGBO(157, 127, 56, 1)
    ],
    [
      Color.fromRGBO(234, 233, 231, 1),
      Color.fromRGBO(213, 212, 211, 1),
      Color.fromRGBO(133, 124, 106, 1)
    ],
    [
      Color.fromRGBO(220, 235, 242, 1),
      Color.fromRGBO(178, 219, 238, 1),
      Color.fromRGBO(76, 125, 148, 1)
    ],
    [
      Color.fromRGBO(202, 223, 242, 1),
      Color.fromRGBO(161, 208, 251, 1),
      Color.fromRGBO(78, 117, 152, 1)
    ],
    [
      Color.fromRGBO(212, 243, 231, 1),
      Color.fromRGBO(173, 233, 209, 1),
      Color.fromRGBO(74, 148, 119, 1)
    ],
    [
      Color.fromRGBO(248, 232, 255, 1),
      Color.fromRGBO(230, 186, 248, 1),
      Color.fromRGBO(138, 85, 161, 1)
    ],
  ];
}
