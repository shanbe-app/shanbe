import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:client/models/Space.dart';
import 'package:client/rx/managers/smart_space_manager.dart';

class SmartSpace {
  final QueryPredicate query;
  final Space space;

  SmartSpace({required this.query, required this.space});
}
