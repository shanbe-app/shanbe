import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:client/models/CalendarType.dart';
import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:client/rx/services/storage_service.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SettingsBloc extends RxBloc {
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  final StorageService storageService;
  final _isFirstVisit = BehaviorSubject<bool>();
  final _calendar = BehaviorSubject<CalendarType>();
  final _locale = BehaviorSubject<Locale>();
  final _theme = BehaviorSubject<ThemeMode>();
  final _quickAddNotificationEnabled = BehaviorSubject<bool>();
  final _dailyNotificationTimeOfDay = BehaviorSubject<String?>();

  Stream<bool> get isFirstVisit => _isFirstVisit.stream;

  Stream<CalendarType> get calendar => _calendar.stream;

  Stream<Locale> get locale => _locale.stream;

  Stream<ThemeMode> get theme => _theme.stream;

  SettingsBloc(this.storageService) {
    _isFirstVisit.add(true);
    // _isFirstVisit.add(
    //     storageService.sharedPreferences.getBool(Constants.FIRST_VISIT_PREFS) ??
    //         true);
    _calendar.add(EnumToString.fromString(
            CalendarType.values,
            storageService.sharedPreferences
                    .getString(Constants.USER_CALENDAR_PREFS) ??
                '') ??
        CalendarType.GREGORIAN);
    _locale.add(Locale(storageService.sharedPreferences
            .getString(Constants.USER_LOCALE_PREFS) ??
        'en'));
    _theme.add(EnumToString.fromString(
            ThemeMode.values,
            storageService.sharedPreferences
                    .getString(Constants.USER_THEME_PREFS) ??
                '') ??
        ThemeMode.system);
    _quickAddNotificationEnabled.add(storageService.sharedPreferences
            .getBool(Constants.USER_QUICK_ADD_PREFS) ??
        false);
    _dailyNotificationTimeOfDay.add(storageService.sharedPreferences
        .getString(Constants.USER_DAILY_NOTIFICATION_TIME_PREFS));
  }

  void onFirstVisit() {
    storageService.sharedPreferences
        .setBool(Constants.FIRST_VISIT_PREFS, false);
  }

  void updateCalendar(CalendarType calendarType) {
    _calendar.add(calendarType);
    storageService.sharedPreferences.setString(Constants.USER_CALENDAR_PREFS,
        EnumToString.convertToString(calendarType));
/*TODO: THIS IS WRONG UPDATE USER PREFERENCES*/
    Amplify.Auth.updateUserAttribute(
        userAttributeKey: Constants.USER_PREFERENCES_COGNITO_KEY,
        value: json.encode({'calendar': calendarType}));
  }

  ThemeMode currentTheme() {
    String? themeMode =
        storageService.sharedPreferences.getString(Constants.USER_THEME_PREFS);
    return strNotEmpty(themeMode)
        ? EnumToString.fromString(ThemeMode.values, themeMode!) ??
            Constants.DEFAULT_THEME
        : Constants.DEFAULT_THEME;
  }

  Locale currentLocale() {
    String? localePrefs =
        storageService.sharedPreferences.getString(Constants.USER_LOCALE_PREFS);
    return strNotEmpty(localePrefs)
        ? Locale.fromSubtags(languageCode: localePrefs!)
        : Constants.DEFAULT_LOCALE;
  }

  @override
  void dispose() {
    _compositeSubscription.dispose();
  }
}
