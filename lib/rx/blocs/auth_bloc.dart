import 'dart:async';
import 'dart:convert';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:client/rx/services/amplify_service.dart';
import 'package:client/rx/services/app_service.dart';
import 'package:client/types/enums.dart';
import 'package:client/types/user.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends RxBloc {
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  final AppService appService;
  final _authState = BehaviorSubject<AuthState>();
  final _authErrors = BehaviorSubject<String>();
  final _user = BehaviorSubject<User?>();

  Stream<AuthState> get authState => _authState.stream;

  Stream<String> get authErrors => _authErrors.stream;

  Stream<User?> get user => _user.stream;

  AuthBloc(this.appService) {
    checkAuth();
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
  void dispose() {
    _compositeSubscription.dispose();
  }

  void checkAuth() {
    Stream.fromFuture(Amplify.Auth.fetchAuthSession()).listen((event) {
      print('event.isSignedIn ${event.isSignedIn}');
      if (event.isSignedIn) {
        Stream.fromFuture(Amplify.Auth.fetchUserAttributes()).listen((event) {
          _user.add(User.fromUserAttributes(event));
          _authState.add(AuthState.authenticated);
        }).onError((e) {
          _authState.add(AuthState.notAuthenticated);
        });
      } else {
        _authState.add(AuthState.notAuthenticated);
      }
    }).onError((e) {
      _authState.add(AuthState.notAuthenticated);
    });
  }

  void authenticate(String username, String password) {
    _authState.add(AuthState.authenticating);
    StreamSubscription subscription = Stream.fromFuture(
            Amplify.Auth.signIn(username: username, password: password))
        .listen((event) {
      if (event.isSignedIn) {
        _authState.add(AuthState.authenticated);
      } else {
        _authState.add(AuthState.notAuthenticated);
      }
    });
    _compositeSubscription.add(subscription);
  }

  void logout() {
    _authState.add(AuthState.authenticating);
    StreamSubscription subscription = Stream.fromFuture(Amplify.Auth.signOut(
            options: const SignOutOptions(globalSignOut: false)))
        .listen((event) {});
    _compositeSubscription.add(subscription);
  }

  void register(String name, String email, String password) {
    Stream.fromFuture(Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(userAttributes: {
          CognitoUserAttributeKey.name: name,
          CognitoUserAttributeKey.email: email
        }))).listen((event) {});
  }

  void socialSignIn(AuthProvider provider) {
    _authState.add(AuthState.authenticating);
    _compositeSubscription
        .add(Stream.fromFuture(Amplify.Auth.signInWithWebUI(provider: provider))
            .listen((event) {
      if (event.isSignedIn) {
        _compositeSubscription
            .add(Stream.fromFuture(Amplify.Auth.fetchUserAttributes())
                .listen((attributes) {
          String? preferencesString = firstOrNull(
                  attributes, (e) => e.userAttributeKey.key == 'preferences')
              ?.value;
          Map preferences = preferencesString != null
              ? jsonDecode(preferencesString)
              : Constants.USER_PREFERENCES_COGNITO_DEFAULT;

          _user.add(User.fromUserAttributes(attributes));

          _authState.add(AuthState.authenticated);
        }))
            .onError((e) {
          _authState.add(AuthState.notAuthenticated);
        });
      } else {
        _authState.add(AuthState.notAuthenticated);
      }
    }))
        .onError((e) {
      print(e.toString());
      _authState.add(AuthState.notAuthenticated);
      _authErrors.add(e.toString());
    });
  }

  void fetchCurrentUser() {
    Stream.fromFuture(Amplify.Auth.fetchAuthSession()).listen((event) {
      Stream.fromFuture(Amplify.Auth.fetchUserAttributes()).listen((event) {});
      // Amplify.Auth.fetchUserAttributes()
      // Amplify.Auth.getCurrentUser()
      event.isSignedIn;
    });
  }

  void updateCalendar(CalendarType calendarType) {
    Stream.fromFuture(Amplify.Auth.fetchUserAttributes())
        .listen((attributes) {});
  }
}
