import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:client/models/TaskList.dart';

class TaskListPageArguments {
  final TaskList taskLists;
  final QueryPredicate? query;

  TaskListPageArguments({required this.taskLists, this.query});
}
