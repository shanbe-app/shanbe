import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:client/models/Space.dart';
import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:client/rx/services/amplify_service.dart';
import 'package:rxdart/rxdart.dart';

class SpaceBloc extends RxBloc {
  final _spaces = BehaviorSubject<List<Space>>();

  Stream<QuerySnapshot<Space>> get spaces =>
      Amplify.DataStore.observeQuery(Space.classType);
}
