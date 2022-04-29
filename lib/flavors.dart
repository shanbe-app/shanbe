enum Flavor { dev, stage, production }

class F {
  static Flavor appFlavor = Flavor.dev;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Shanbe dev';
      case Flavor.production:
        return 'Shanbe';
      default:
        return 'title';
    }
  }

  static String get openIdConfigurationUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'http://dev.shanbe.app:8080/auth/realms/shanbe/.well-known/openid-configuration';
      case Flavor.production:
        return 'https://auth.shanbe.app/auth/realms/shanbe/.well-known/openid-configuration';
      default:
        return 'https://auth.shanbe.app/auth/realms/shanbe/.well-known/openid-configuration';
    }
  }

  static String get openIdUserInfoUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'http://dev.shanbe.app:8080/auth/realms/shanbe/protocol/openid-connect/userinfo';
      case Flavor.production:
        return 'https://auth.shanbe.app/auth/realms/shanbe/protocol/openid-connect/userinfo';
      default:
        return 'https://auth.shanbe.app/auth/realms/shanbe/protocol/openid-connect/userinfo';
    }
  }

  static String get logoutUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'http://dev.shanbe.app:8080/auth/realms/shanbe/protocol/openid-connect/logout?redirect_uri=https://google.com';
      case Flavor.production:
        return 'https://auth.shanbe.app/auth/realms/shanbe/protocol/openid-connect/logout?redirect_uri=https://google.com';
      default:
        return 'https://auth.shanbe.app/auth/realms/shanbe/protocol/openid-connect/logout?redirect_uri=https://google.com';
    }
  }

  static String get clientSecret {
    switch (appFlavor) {
      case Flavor.dev:
        return '09aabc24-7381-4e30-bc42-7b3d9307b44e';
      case Flavor.production:
        return 'fd098d75-ed33-47a5-ae2e-3640bdb5f07f';
      default:
        return 'fd098d75-ed33-47a5-ae2e-3640bdb5f07f';
    }
  }

  static String get syncGatewaySyncUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'ws://dev.shanbe.app:4984/todos';
      case Flavor.production:
        return 'wss://sync.shanbe.app/todos';
      default:
        return 'wss://sync.shanbe.app/todos';
    }
  }

  static String get syncGatewaySessionUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'http://dev.shanbe.app:4984/todos/_session';
      case Flavor.production:
        return 'https://sync.shanbe.app/todos/_session';
      default:
        return 'https://sync.shanbe.app/todos/_session';
    }
  }

  static bool get allowInsecureConnection {
    switch (appFlavor) {
      case Flavor.dev:
        return true;
      case Flavor.production:
        return false;
      default:
        return false;
    }
  }

  static String get flavorName {
    switch (appFlavor) {
      case Flavor.dev:
        return 'development';
      case Flavor.production:
        return 'production';
      default:
        return 'production';
    }
  }

  static String get restApiUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'http://dev.shanbe.app:8888/api';
      case Flavor.production:
        return 'https://api.shanbe.app/api';
      default:
        return 'https://api.shanbe.app/api';
    }
  }

  static String get baseApiUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'http://dev.shanbe.app:8888';
      case Flavor.production:
        return 'https://api.shanbe.app';
      default:
        return 'https://api.shanbe.app';
    }
  }
}
