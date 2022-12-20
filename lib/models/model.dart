import 'package:uuid/uuid.dart';

abstract class Model {
  final String createdByUserId;
  final String id = const Uuid().v4();
  final String object;
  final DateTime createdAt;

  Model(
      {required this.object,
      required this.createdByUserId,
      required this.createdAt});

  Map<String, Object?> toMap();
}
