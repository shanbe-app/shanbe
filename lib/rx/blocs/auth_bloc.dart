import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:client/types/enums.dart';
import 'package:client/types/user.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends RxBloc {
  final _authState = BehaviorSubject<AuthState>();
  final _authErrors = BehaviorSubject<String>();
  final _authUser = BehaviorSubject<User?>();

  Stream<AuthState> get authState => _authState.stream;

  Stream<String> get authErrors => _authErrors.stream;

  Stream<User?> get authUser => _authUser.stream;

  AuthBloc() {
    autoLogin();
    Amplify.Hub.listen([HubChannel.Auth], (event) {
      switch (event.eventName) {
        case 'SIGNED_IN':
          _authState.add(AuthState.authenticated);
          break;
        case 'SIGNED_OUT':
          _authState.add(AuthState.notAuthenticated);
          break;
        case 'SESSION_EXPIRED':
          _authState.add(AuthState.notAuthenticated);
          break;
        case 'USER_DELETED':
          _authState.add(AuthState.notAuthenticated);
          break;
      }
    });
  }

  @override
  void dispose() {}

  void autoLogin() {
    _authState.add(AuthState.authenticating);
    addFutureSubscription(Amplify.Auth.fetchAuthSession(), (AuthSession event) {
      if (event.isSignedIn) {
        authenticate();
      } else {
        _authState.add(AuthState.notAuthenticated);
      }
    }, (e) {
      _authState.add(AuthState.notAuthenticated);
    });
  }

  void authenticate() {
    addFutureSubscription(Amplify.Auth.fetchUserAttributes(),
        (List<AuthUserAttribute> event) {
      _authUser.add(User.fromCognitoUserAttributes(event));
      _authState.add(AuthState.authenticated);
    }, (e) {
      _authState.add(AuthState.notAuthenticated);
    });
  }

  void login(String username, String password) {
    _authState.add(AuthState.authenticating);
    addFutureSubscription(
        Amplify.Auth.signIn(username: username, password: password),
        (SignInResult event) {
      if (event.isSignedIn) {
        _authState.add(AuthState.authenticated);
      } else {
        _authState.add(AuthState.notAuthenticated);
      }
    }, (e) => _authState.add(AuthState.notAuthenticated));
  }

  void logout() {
    _authState.add(AuthState.authenticating);
    addFutureSubscription(
        Amplify.Auth.signOut(
            options: const SignOutOptions(globalSignOut: false)), (event) {
      _authState.add(AuthState.notAuthenticated);
    });
  }

  void register(String name, String email, String password) {
    addFutureSubscription(
        Amplify.Auth.signUp(
            username: email,
            password: password,
            options: CognitoSignUpOptions(userAttributes: {
              CognitoUserAttributeKey.name: name,
              CognitoUserAttributeKey.email: email
            })),
        (SignUpResult result) {},
        (e) {});
  }

  void socialSignIn(AuthProvider provider) {
    _authState.add(AuthState.authenticating);
    addFutureSubscription(Amplify.Auth.signInWithWebUI(provider: provider),
        (SignInResult event) {
      if (event.isSignedIn) {
        authenticate();
      } else {
        _authState.add(AuthState.notAuthenticated);
      }
    }, (e) {
      _authState.add(AuthState.notAuthenticated);
      _authErrors.add(e.toString());
    });
  }
}
