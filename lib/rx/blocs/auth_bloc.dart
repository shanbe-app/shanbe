import 'dart:async';

import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:client/types/enums.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc extends RxBloc {
  final _authState = BehaviorSubject<UserAuthState>();
  final _authErrors = BehaviorSubject<String>();
  final _authUser = BehaviorSubject<User?>();

  Stream<UserAuthState> get authState => _authState.stream;

  Stream<String> get authErrors => _authErrors.stream;

  Stream<User?> get authUser => _authUser.stream;

  AuthBloc() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        _authState.add(UserAuthState.notAuthenticated);
      } else {
        _authState.add(UserAuthState.authenticated);
      }
    });
  }

  @override
  void dispose() {}

  void login(String username, String password) {
    _authState.add(UserAuthState.authenticating);
    addFutureSubscription(
        FirebaseAuth.instance.signInWithEmailAndPassword(
            email: username, password: password), (UserCredential event) {
      if (event.user != null) {
        _authState.add(UserAuthState.authenticated);
      } else {
        _authState.add(UserAuthState.notAuthenticated);
      }
    }, (e) => _authState.add(UserAuthState.notAuthenticated));
  }

  void logout() {
    _authState.add(UserAuthState.authenticating);
    addFutureSubscription(FirebaseAuth.instance.signOut(), (event) {
      _authState.add(UserAuthState.notAuthenticated);
    });
  }

  void register(String name, String email, String password) {
    addFutureSubscription(
        FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ), (UserCredential result) {
/*TODO: HANDLE EMAIL SHOWING PROCESS*/
    }, (e) {});
  }

  void socialSignIn() {
    _authState.add(UserAuthState.authenticating);
    addFutureSubscription(
        FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider()),
        (UserCredential event) {
      if (event.user != null) {
        _authUser.add(event.user);
      } else {
        _authUser.add(null);
        _authState.add(UserAuthState.notAuthenticated);
      }
    }, (e) {
      _authUser.add(null);
      _authState.add(UserAuthState.notAuthenticated);
      _authErrors.add(e.toString());
    });
  }
}
