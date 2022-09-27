import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:client/utils/utils.dart';

class User {
  final String email;
  final String name;
  final String? picture;
  final bool isPremium;

  User._(
      {required this.email,
      required this.name,
      this.picture,
      required this.isPremium});

  factory User.fromCognitoUserAttributes(List<AuthUserAttribute> attributes) {
    print('attributes ${attributes}');
    int? isPremium = firstOrNull(attributes,
            (element) => element.userAttributeKey.key == 'is_premium')?.value
        as int?;
    return User._(
        email: attributes
            .firstWhere((element) => element.userAttributeKey.key == 'email')
            .value,
        name: attributes
            .firstWhere((element) => element.userAttributeKey.key == 'name')
            .value,
        picture: firstOrNull(attributes,
            (element) => element.userAttributeKey.key == 'picture')?.value,
        isPremium: isPremium == 0);
  }
}
