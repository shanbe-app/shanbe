import 'package:client/models/preferences.dart';
import 'package:client/models/workspace.dart';
import 'package:client/rx/blocs/auth_bloc.dart';
import 'package:client/rx/blocs/preference_bloc.dart';
import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:client/rx/blocs/workspace_bloc.dart';
import 'package:client/rx/managers/models_collection.dart';
import 'package:client/rx/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class OnboardBloc extends RxBloc {
  late final FirebaseService _firebaseService;
  late final AuthBloc _authBloc;
  final _settingUpAccount = BehaviorSubject<bool>();
  late final CollectionReference<Preferences> preferenceRef;
  late final WorkspaceBloc workspaceBloc;
  late final PreferencesBloc preferencesBloc;

  Stream<bool> get settingUpAccount => _settingUpAccount.stream;

  OnboardBloc(this._firebaseService)
      : workspaceBloc = WorkspaceBloc(_firebaseService),
        preferencesBloc = PreferencesBloc(_firebaseService),
        preferenceRef = preferencesCollectionReference(_firebaseService),
        _authBloc = AuthBloc(_firebaseService);

  void setupWithAccount() {}

  Future<void> setupAnonymous(bool shareAnonymousData, String workspaceName,
      {required Function onError}) async {
    _settingUpAccount.add(true);
    try {
      UserCredential? credentials = await _authBloc.signInAnonymouslyAsync();
      if (credentials == null) throw Exception('credentials is null');
      print('anonymous user:');
      print(credentials.additionalUserInfo);
      print(credentials.user);
      print(credentials.credential);
      print(credentials.runtimeType);
      User? user = credentials.user;
      if (user == null) throw Exception('User is null');
      await workspaceBloc.createWorkspace(user.uid, workspaceName);
      await preferencesBloc.createPreference(user.uid);
      _settingUpAccount.add(false);
    } catch (e) {
      onError(onError);
      _settingUpAccount.add(false);
    }
  }

  Future<void> setupAccount(bool shareAnonymous, UserCredential credential,
      String defaultWorkspaceName) async {
    User? user = credential.user;
    if (user == null) {
      throw Exception('user is null');
    }
    List<WorkSpace> workspaces = await workspaceBloc.allWorkspaces(user.uid);
    List<Preferences> preferences =
        await preferencesBloc.allPreferences(user.uid);
    if (workspaces.isEmpty) {
      await workspaceBloc.createWorkspace(user.uid, defaultWorkspaceName);
    }
    if (preferences.isEmpty) {
      await preferencesBloc.createPreference(user.uid);
    } else if (preferences.length > 1) {
      preferences.sort((p1, p2) => p1.updatedAt.millisecondsSinceEpoch
          .compareTo(p2.updatedAt.millisecondsSinceEpoch));
      await preferencesBloc.deletePreferences(preferences.sublist(1));
    }
  }
}
