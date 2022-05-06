class User {
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final bool emailVerified;
  final String sub;
  final String? userId;
  final String? sgUserId;

  User._(this.name, this.firstName, this.lastName, this.email,
      this.emailVerified, this.sub, this.userId, this.sgUserId);

  factory User.fromJson(Map userInfo, String? userId, String? sgUserId) {
    return User._(
        userInfo['name'],
        userInfo['given_name'],
        userInfo['family_name'],
        userInfo['email'],
        userInfo['email_verified'] as bool,
        userInfo['sub'],
        userId,
        sgUserId);
  }

  factory User.fromUser(User user,
          {String? firstName, String? lastName, String? name}) =>
      User._(
          name ?? user.name,
          firstName ?? user.firstName,
          lastName ?? user.lastName,
          user.email,
          user.emailVerified,
          user.sub,
          user.userId,
          user.sgUserId);
}
