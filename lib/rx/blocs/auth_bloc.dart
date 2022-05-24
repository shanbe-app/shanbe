import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:client/rx/services/amplify_service.dart';
import 'package:client/rx/services/app_service.dart';
import 'package:client/types/states/auth_state.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends RxBloc {
  final AmplifyService amplifyService;
  final _authState = BehaviorSubject<AuthState>();

  AuthBloc(AppService service) : amplifyService = service.amplifyService {
/*    Amplify.Hub.listen([HubChannel.Auth], (event) {
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
    });*/
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
    compositeSubscription.add(subscription);
  }

  void logout() {
    _authState.add(AuthState.authenticating);
    StreamSubscription subscription = Stream.fromFuture(Amplify.Auth.signOut(
            options: const SignOutOptions(globalSignOut: false)))
        .listen((event) {});
    compositeSubscription.add(subscription);
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
    Stream.fromFuture(Amplify.Auth.signInWithWebUI(provider: provider))
        .listen((event) {
      print('event ${event.isSignedIn} ${event.nextStep}');
    });
  }

  void fetchCurrentUser() {
    Stream.fromFuture(Amplify.Auth.fetchAuthSession()).listen((event) {
      Stream.fromFuture(Amplify.Auth.fetchUserAttributes()).listen((event) {
        
      });
      // Amplify.Auth.fetchUserAttributes()
      // Amplify.Auth.getCurrentUser()
      event.isSignedIn;
    });
  }

  @override
  void dispose() {
    compositeSubscription.dispose();
  }
}
