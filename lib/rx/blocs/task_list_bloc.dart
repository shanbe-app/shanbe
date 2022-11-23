import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:client/models/TaskList.dart';
import 'package:client/rx/blocs/rx_bloc.dart';

class TaskListBloc extends RxBloc {
  Stream<QuerySnapshot<TaskList>> get spacesQuery =>
      Amplify.DataStore.observeQuery(TaskList.classType);

  Stream<List<TaskList>> get taskLists =>
      Amplify.DataStore.observeQuery(TaskList.classType)
          .map((event) => event.items);

  void createTaskList({TaskList? parentSpace, required TaskList newSpace}) {
    if (parentSpace != null) {
      Amplify.DataStore.save(parentSpace.copyWith(
          childTaskLists: parentSpace.childTaskLists != null
              ? [...parentSpace.childTaskLists!, newSpace]
              : [newSpace]));
    } else {
      Amplify.DataStore.save(newSpace);
    }
  }
}
