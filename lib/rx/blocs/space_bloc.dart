import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:client/models/Space.dart';
import 'package:client/rx/blocs/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SpaceBloc extends RxBloc {
  Stream<QuerySnapshot<Space>> get spaces =>
      Amplify.DataStore.observeQuery(Space.classType);

  void createSpace({Space? parentSpace, required Space newSpace}) {
    if (parentSpace != null) {
      Amplify.DataStore.save(parentSpace.copyWith(
          spaces: parentSpace.spaces != null
              ? [...parentSpace.spaces!, newSpace]
              : [newSpace]));
    } else {
      Amplify.DataStore.save(newSpace);
    }
  }
}
