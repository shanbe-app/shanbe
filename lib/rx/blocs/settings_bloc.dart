import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:client/rx/services/storage_service.dart';
import 'package:client/types/enums.dart';
import 'package:client/utils/constants.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SettingsBloc extends RxBloc {
  final StorageService storageService;
  final _isFirstVisit = BehaviorSubject<bool>();
  final _calendar = BehaviorSubject<CalendarType>();
  final _language = BehaviorSubject<Locale>();
  final _theme = BehaviorSubject<ThemeType>();
  final _quickAddNotificationEnabled = BehaviorSubject<bool>();
  final _dailyNotificationTimeOfDay = BehaviorSubject<String?>();

  Stream<bool> get isFirstVisit => _isFirstVisit.stream;

  SettingsBloc(this.storageService) {
    _isFirstVisit.add(
        storageService.sharedPreferences.getBool(Constants.FIRST_VISIT_PREFS) ??
            true);
    _calendar.add(EnumToString.fromString(
            CalendarType.values,
            storageService.sharedPreferences
                    .getString(Constants.USER_CALENDAR_PREFS) ??
                '') ??
        CalendarType.gregorian);
    _language.add(Locale(storageService.sharedPreferences
            .getString(Constants.USER_LOCALE_PREFS) ??
        'en'));
    _theme.add(EnumToString.fromString(
            ThemeType.values,
            storageService.sharedPreferences
                    .getString(Constants.USER_THEME_PREFS) ??
                '') ??
        ThemeType.systemDefault);
    _quickAddNotificationEnabled.add(storageService.sharedPreferences
            .getBool(Constants.USER_QUICK_ADD_PREFS) ??
        false);
    _dailyNotificationTimeOfDay.add(storageService.sharedPreferences
        .getString(Constants.USER_DAILY_NOTIFICATION_TIME_PREFS));
  }

  @override
  void dispose() {
    compositeSubscription.dispose();
  }
}
