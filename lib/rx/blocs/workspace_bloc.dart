import 'package:client/models/workspace.dart';
import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:client/rx/managers/models_collection.dart';
import 'package:client/rx/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class WorkspaceBloc extends RxBloc {
  late final CollectionReference<WorkSpace> workspaceRef;
  final FirebaseService _firebaseService;

  WorkspaceBloc(this._firebaseService)
      : workspaceRef = workspaceCollectionReference(_firebaseService);

  Future<void> createWorkspace(String userId, String workspaceName) async {
    WorkSpace workspace =
        WorkSpace(userId: userId, name: workspaceName, id: const Uuid().v4());
    await workspaceRef.doc(workspace.id).set(workspace);
  }

  Future<List<WorkSpace>> allWorkspaces(String userId) async {
    return (await workspaceRef.where('uid', isEqualTo: userId).get())
        .docs
        .map((e) => e.data())
        .toList();
  }
}
