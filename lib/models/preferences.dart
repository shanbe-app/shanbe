import 'package:client/models/model.dart';
import 'package:client/types/enums.dart';
import 'package:client/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

class Preferences extends Model {
  final CalendarType calendar;
  final Locale locale;
  final StartOfTheWeekType startOfTheWeekType;
  final ThemeType theme;

  Preferences(
      {required String uid,
      required String id,
      required this.calendar,
      required this.startOfTheWeekType,
      required this.theme,
      required this.locale,
      required Timestamp createdAt,
      required Timestamp updatedAt})
      : super(uid: uid, id: id, createdAt: createdAt, updatedAt: updatedAt);

  factory Preferences.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    var data = snapshot.data();
    return Preferences(
        uid: data?['uid'],
        id: data?['id'],
        calendar:
            EnumToString.fromString(CalendarType.values, data?['calendar'])!,
        startOfTheWeekType: EnumToString.fromString(
            StartOfTheWeekType.values, data?['startOfTheWeek'])!,
        theme: EnumToString.fromString(ThemeType.values, data?['theme'])!,
        locale: Locale.fromSubtags(
            languageCode: languageCodeFromLocaleName(data?['locale']),
            countryCode: countryCodeFromLocaleName(data?['locale'])),
        createdAt: Timestamp.fromMillisecondsSinceEpoch(data?['createdAt']),
        updatedAt: Timestamp.fromMillisecondsSinceEpoch(data?['updatedAt']));
  }

  @override
  Map<String, Object?> toMap() {
    return {
      'uid': uid,
      'id': id,
      'locale': locale.toString(),
      'calendar': EnumToString.convertToString(calendar),
      'theme': EnumToString.convertToString(theme),
      'startOfTheWeek': EnumToString.convertToString(startOfTheWeekType),
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch
    };
  }
}
