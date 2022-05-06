import 'dart:convert';

import 'package:client/flavors.dart';
import 'package:client/rx/services/rx_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class AuthService extends RxService {
  final String clientId = F.clientId;
  final String redirectUrl = F.redirectUrl;
  final String discoveryUrl = F.discoveryUrl;
  final bool allowInsecureConnection = F.allowInsecureConnection;
  final String clientSecret = F.clientSecret;
  final List<String> promptValues = ['login'];
  final List<String> scopes = ['openid', 'email', 'profile', 'offline_access'];
  final FlutterAppAuth auth = FlutterAppAuth();

  Future<AuthorizationResponse?> authorizationCodeResponse() async {
    try {
      AuthorizationResponse? response = await auth.authorize(
          AuthorizationRequest(clientId, redirectUrl,
              allowInsecureConnections: allowInsecureConnection,
              promptValues: promptValues,
              scopes: scopes,
              discoveryUrl: discoveryUrl));
      return response;
    } catch (e) {}
  }

  Future<TokenResponse?> codeTokenExchange(
      String authorizationCode, String codeVerifier) async {
    final TokenResponse? result = await auth.token(TokenRequest(
        clientId, redirectUrl,
        authorizationCode: authorizationCode,
        grantType: 'authorization_code',
        codeVerifier: codeVerifier,
        allowInsecureConnections: F.allowInsecureConnection,
        clientSecret: F.clientSecret,
        scopes: ['openid', 'email', 'profile', 'offline_access'],
        discoveryUrl: F.openIdConfigurationUrl));
    return result;
  }

  Future<TokenResponse?> tokenResponse() async {
    TokenResponse? response = await auth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(clientId, redirectUrl,
            allowInsecureConnections: allowInsecureConnection,
            clientSecret: clientSecret,
            promptValues: promptValues,
            scopes: scopes,
            discoveryUrl: discoveryUrl));
    return response;
  }

  Future<TokenResponse?> refreshToken(String refreshToken) async {
    final TokenResponse? result = await auth.token(TokenRequest(
        clientId, redirectUrl,
        refreshToken: refreshToken,
        allowInsecureConnections: allowInsecureConnection,
        clientSecret: clientSecret,
        scopes: scopes,
        discoveryUrl: discoveryUrl));
    return result;
  }

  Future<void> autoLogin(Function onLogin, Function onLogout,
      Function onSyncFinish, Function onSyncStatusChange,
      {TokenResponse? tokenResponse,
      ConnectivityResult? connectivityResult}) async {
    SharedPreferences prefs =
        GetIt.I.get<SharedPreferences>(instanceName: 'prefs');
    FlutterSecureStorage secureStorage =
        GetIt.I.get<FlutterSecureStorage>(instanceName: 'secureStorage');
    if (tokenResponse == null) {
      String? userInfoPref = prefs.getString(Constants.USER_INFO_PREFS);
      String? rToken =
          await secureStorage.read(key: Constants.REFRESH_TOKEN_PREFS);
      if (rToken != null && rToken != '') {
        if (connectivityResult != null &&
                connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          try {
            tokenResponse = await refreshToken(rToken);
          } catch (e) {
            onLogout();
            return;
          }
        } else {
          if (userInfoPref != null && userInfoPref != '') {
            try {
              onLogin(json.decode(userInfoPref));
            } catch (e) {
              onLogout();
              return;
            }
          }
        }
      } else {
        onLogout();
        return;
      }
    }
    if (tokenResponse != null) {
      try {
        AuthApi authApi = await registerAuthApi(tokenResponse.accessToken);
        Map<String, dynamic> kcUserInfo = await authApi.getKCUserProfile();
        Map<String, dynamic> userSubscriptionResponse =
            await authApi.userSubscriptions();
        SyncGatewayAuthResponse sgAuthResponse = await initializeSync(
            tokenResponse.idToken ?? '',
            kcUserInfo['sub'],
            onSyncFinish,
            onSyncStatusChange);
        onLogin(kcUserInfo, tokenResponse, sgAuthResponse,
            userSubscriptionResponse);
      } catch (e) {
        onLogout();
      }
    }
  }

  @override
  Future<void> onCreate() async {}

  @override
  Future<void> onTerminate() async {}
}
