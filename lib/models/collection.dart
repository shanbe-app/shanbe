import 'package:client/models/model.dart';

enum CollectionSchemaType { select, text, createdTime }

class Collection extends Model {
  final String parentId;
  final String? icon;
  final List<Map<String, CollectionSchemaType>> schema;

  Collection(
      {required this.parentId,
      required this.icon,
      required this.schema,
      required String userId})
      : super(
            object: 'collection',
            createdAt: DateTime.now(),
            createdByUserId: userId);

  @override
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'parentId': parentId,
      'schema': schema.toString(),
      'icon': icon,
      'createdAt': createdAt.toUtc().millisecondsSinceEpoch
    };
  }
}
