import 'package:client/models/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';

enum CollectionSchemaType { select, text, createdTime }

class CollectionSchema {
  final String id;
  final CollectionSchemaType type;

  CollectionSchema({required this.id, required this.type});

  factory CollectionSchema.fromFirestore(Map<String, String?> data) {
    return CollectionSchema(
        id: data['id']!,
        type: EnumToString.fromString(
            CollectionSchemaType.values, data['type']!)!);
  }

  Map<String, Object?> toMap() {
    return {'id': id, 'type': EnumToString.convertToString(type)};
  }
}

class Collection extends Model {
  final String parentId;
  final String? icon;
  final List<CollectionSchema> schema;

  Collection(
      {required this.parentId,
      required this.icon,
      required this.schema,
      Timestamp? createdAt,
      Timestamp? updatedAt,
      required String id,
      required String userId})
      : super(
            createdAt: createdAt ?? Timestamp.now(),
            updatedAt: Timestamp.now(),
            uid: userId,
            id: id);

  factory Collection.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    var data = snapshot.data();
    print('collection view data');
    print(data);
    return Collection(
      id: data?['id'],
      parentId: data?['parentId'],
      userId: data?['uid'],
      icon: data?['icon'],
      schema: (data?['schema'] as List<Map<String, String>>)
          .map((e) => CollectionSchema.fromFirestore(e))
          .toList(),
      createdAt: Timestamp.fromMillisecondsSinceEpoch(data?['createdAt']),
      updatedAt: Timestamp.fromMillisecondsSinceEpoch(data?['updatedAt']),
    );
  }

  @override
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'parentId': parentId,
      'icon': icon,
      'uid': uid,
      'schema': schema.map((e) => e.toMap()).toList(),
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch
    };
  }
}
