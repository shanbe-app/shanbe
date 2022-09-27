import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:client/models/Space.dart';

class SpacePageArguments {
  final Space space;
  final QueryPredicate? query;

  SpacePageArguments({required this.space, this.query});
}
