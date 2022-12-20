import 'package:client/models/block.dart';
import 'package:client/models/model.dart';
import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:client/rx/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class ModelBloc<T extends Model> extends RxBloc {
  final FirebaseService firebaseService;
  final _isFirstVisit = BehaviorSubject<bool>();
  final _allPages = BehaviorSubject<QuerySnapshot<List<T>>>();
  final CollectionReference _pagesRef;

  Stream<bool> get isFirstVisit => _isFirstVisit.stream;

  ModelBloc(this.firebaseService)
      : _pagesRef = firebaseService.firestore.collection('pages') {
    _allPages
        .addStream(_pagesRef.snapshots() as Stream<QuerySnapshot<List<T>>>);
  }

  void createPage(
    T page,
  ) {
    addFutureSubscription(
      _pagesRef.doc(page.id).set(page),
    );
  }

  void update(T page) {
    addFutureSubscription(_pagesRef.doc(page.id).update(page.toMap()));
  }

  void delete(T page, Function(void) onData, Function(Exception) onError) {
    addFutureSubscription(_pagesRef.doc(page.id).delete(), onData, onError);
  }
}
