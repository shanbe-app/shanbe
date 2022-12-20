import 'package:client/models/block.dart';
import 'package:client/models/model.dart';
import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:client/rx/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class ModelBloc<T extends Model> extends RxBloc {
  final FirebaseService firebaseService;
  final _isFirstVisit = BehaviorSubject<bool>();
  final _allModels = BehaviorSubject<QuerySnapshot>();
  final CollectionReference collectionRef;

  Stream<bool> get isFirstVisit => _isFirstVisit.stream;
  Stream<QuerySnapshot> get allModels => _allModels.stream;

  ModelBloc(this.firebaseService, String collectionPath)
      : collectionRef = firebaseService.firestore.collection(collectionPath) {
    _allModels.addStream(collectionRef.snapshots());
  }

  void createPage(
    T page,
  ) {
    addFutureSubscription(
      collectionRef.doc(page.id).set(page),
    );
  }

  void update(T page) {
    addFutureSubscription(collectionRef.doc(page.id).update(page.toMap()));
  }

  void delete(T page, Function(void) onData, Function(Exception) onError) {
    addFutureSubscription(collectionRef.doc(page.id).delete(), onData, onError);
  }
}
