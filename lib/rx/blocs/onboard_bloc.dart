import 'package:client/models/workspace.dart';
import 'package:client/rx/blocs/auth_bloc.dart';
import 'package:client/rx/blocs/models_bloc.dart';
import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:client/rx/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

class OnboardBloc extends RxBloc {
  late final FirebaseService _firebaseService;
  late final AuthBloc _authBloc;
  final _settingUpAccount = BehaviorSubject<bool>();
  late final CollectionReference<WorkSpace> workspaceRef;

  Stream<bool> get settingUpAccount => _settingUpAccount.stream;

  OnboardBloc(this._firebaseService)
      : workspaceRef = workspaceCollectionReference(_firebaseService),
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
      WorkSpace workspace = WorkSpace(
          userId: user.uid, name: workspaceName, id: const Uuid().v4());
      await workspaceRef.doc(workspace.id).set(workspace);
      _settingUpAccount.add(false);
    } catch (e) {
      onError(onError);
      _settingUpAccount.add(false);
    }
  }
}
