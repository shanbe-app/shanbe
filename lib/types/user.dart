import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:client/utils/utils.dart';

class User {
  final String email;
  final String name;
  final String? picture;
  final bool isPremium;

  User._(this.email, this.name, this.picture, this.isPremium);

  factory User.fromUserAttributes(List<AuthUserAttribute> attributes) {
    int? isPremium = firstOrNull(attributes,
            (element) => element.userAttributeKey.key == 'is_premium')?.value
        as int?;
    return User._(
        attributes
            .firstWhere((element) => element.userAttributeKey.key == 'email')
            .value,
        attributes
            .firstWhere((element) => element.userAttributeKey.key == 'name')
            .value,
        firstOrNull(attributes,
            (element) => element.userAttributeKey.key == 'picture')?.value,
        isPremium == 0);
  }
}
