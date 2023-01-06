import 'dart:async';

import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:client/rx/services/firebase_service.dart';
import 'package:client/types/enums.dart';
import 'package:client/utils/constants.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc extends RxBloc {
  final _authState = BehaviorSubject<UserAuthState>();
  final _authErrors = BehaviorSubject<String>();
  final _authUser = BehaviorSubject<User?>();
  late final FirebaseAuth firebaseAuth;

  Stream<UserAuthState> get authState => _authState.stream;

  Stream<String> get authErrors => _authErrors.stream;

  Stream<User?> get authUser => _authUser.stream;

  AuthBloc(FirebaseService firebaseService)
      : firebaseAuth = firebaseService.firebaseAuth {
    firebaseAuth.authStateChanges().listen((user) {
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
        firebaseAuth.signInWithEmailAndPassword(
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
    addFutureSubscription(firebaseAuth.signOut(), (event) {
      _authState.add(UserAuthState.notAuthenticated);
    });
  }

  void register(String name, String email, String password) {
    addFutureSubscription(
        firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ), (UserCredential result) {
/*TODO: HANDLE EMAIL SHOWING PROCESS*/
    }, (e) {});
  }

  void socialSignIn() {
    _authState.add(UserAuthState.authenticating);
    addFutureSubscription(firebaseAuth.signInWithProvider(GoogleAuthProvider()),
        (UserCredential event) {
      _userLogin(event);
    }, (e) {
      _authError(e);
    });
  }

  void _authError(e) {
    _authUser.add(null);
    _authState.add(UserAuthState.notAuthenticated);
    _authErrors.add(e.toString());
  }

  void _userLogin(UserCredential? event) {
    var user = event?.user;
    if (user != null) {
      _authUser.add(user);
    } else {
      _authUser.add(null);
      _authState.add(UserAuthState.notAuthenticated);
    }
  }

  void signInAnonymously() {
    addFutureSubscription(signInAnonymouslyAsync());
  }

  Future<UserCredential?> signInAnonymouslyAsync() async {
    try {
      var credentials = await firebaseAuth.signInAnonymously();
      _userLogin(credentials);
      return credentials;
    } catch (e) {
      _authError(e);
    }
    return null;
  }

  Future<void> continueWithEmail(String email) async {
    print(await firebaseAuth.fetchSignInMethodsForEmail(email));
  }

  Future<void> sendPasswordResetLink(String email) async {
    await firebaseAuth.sendPasswordResetEmail(
        email: email,
        actionCodeSettings: ActionCodeSettings(
            androidInstallApp: true,
            handleCodeInApp: true,
            url: '',
            iOSBundleId: Constants.PACKAGE_NAME,
            androidPackageName: Constants.PACKAGE_NAME,
            dynamicLinkDomain: Constants.DYNAMIC_LINK_DOMAIN,
            androidMinimumVersion: '1.0.0'));
  }
}
