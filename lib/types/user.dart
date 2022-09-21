import 'dart:convert';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:client/types/enums.dart';
import 'package:client/utils/utils.dart';
import 'package:enum_to_string/enum_to_string.dart';

class User {
  final String email;
  final String name;
  final String? picture;
  final bool isPremium;
  final CalendarType calendarType;

  User._(
      {required this.email,
      required this.name,
      this.picture,
      required this.calendarType,
      required this.isPremium});

  factory User.fromUserAttributes(List<AuthUserAttribute> attributes) {
    int? isPremium = firstOrNull(attributes,
            (element) => element.userAttributeKey.key == 'is_premium')?.value
        as int?;
    Map preferences = json.decode(firstOrNull(attributes,
                (element) => element.userAttributeKey.key == 'preferences')
            ?.value ??
        '{}');
    return User._(
        email: attributes
            .firstWhere((element) => element.userAttributeKey.key == 'email')
            .value,
        name: attributes
            .firstWhere((element) => element.userAttributeKey.key == 'name')
            .value,
        picture: firstOrNull(attributes,
            (element) => element.userAttributeKey.key == 'picture')?.value,
        calendarType: preferences['calendar'] != null
            ? EnumToString.fromString(
                CalendarType.values, preferences['calendar'])!
            : CalendarType.gregorian,
        isPremium: isPremium == 0);
  }
}
