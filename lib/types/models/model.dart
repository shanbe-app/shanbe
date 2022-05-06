import 'package:uuid/uuid.dart';

abstract class Model {
  late final String TYPE;
  late final String ALIAS;

  String get genUuid => const Uuid().v4();
}