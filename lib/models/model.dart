import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Model {
  final String uid;
  final String id;

  final Timestamp createdAt;
  final Timestamp updatedAt;

  Model(
      {required this.uid,
      required this.id,
      required this.createdAt,
      required this.updatedAt});

  Map<String, Object?> toMap();
}
