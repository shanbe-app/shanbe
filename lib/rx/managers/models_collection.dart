import 'package:client/models/preferences.dart';
import 'package:client/models/workspace.dart';
import 'package:client/rx/managers/model_bloc.dart';
import 'package:client/rx/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference<WorkSpace> workspaceCollectionReference(
    FirebaseService firebaseService) {
  return ModelBloc(firebaseService, 'workspaces')
      .collectionRef
      .withConverter<WorkSpace>(
          fromFirestore: WorkSpace.fromFirestore,
          toFirestore: (model, options) => model.toMap());
}

CollectionReference<Preferences> preferencesCollectionReference(
    FirebaseService firebaseService) {
  return ModelBloc(firebaseService, 'preferences')
      .collectionRef
      .withConverter<Preferences>(
          fromFirestore: Preferences.fromFirestore,
          toFirestore: (model, options) => model.toMap());
}
