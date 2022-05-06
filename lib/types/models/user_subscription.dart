class UserSubscription {
  final DateTime? validUntil;
  final List<dynamic> subscriptions;
  final bool isPremium;

  UserSubscription._(this.validUntil, this.isPremium, this.subscriptions);

  factory UserSubscription.fromJson(
          Map subscriptionResponse) =>
      UserSubscription._(
          subscriptionResponse['premiumUntil'] != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  subscriptionResponse['premiumUntil'] * 1000)
              : DateTime.now(),
          subscriptionResponse['isPremium'],
          subscriptionResponse['subscriptions']);

  factory UserSubscription.init() => UserSubscription._(null, false, []);
}
