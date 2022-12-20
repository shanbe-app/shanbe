import 'package:client/models/model.dart';

enum BlockType { page, collectionView, collectionViewPage }

enum BlockParentTable {
  collection,
  page,
  block,
  collectionView,
  collectionViewPage,
  workspace
}

class Block extends Model {
  final BlockType type;
  final String? copiedFrom;
  final BlockParentTable parentTable;
  final String parentTableId;
  final String? collectionId;
  final DateTime editedAt;
  final String workspaceId;

  Block(
      {required this.type,
      this.copiedFrom,
      required this.parentTable,
      required this.parentTableId,
      this.collectionId,
      required this.editedAt,
      required this.workspaceId,
      required String userId})
      : super(
            createdByUserId: userId,
            object: 'block',
            createdAt: DateTime.now());

  @override
  Map<String, Object?> toMap() {
    return {
      'type': type,
      'object': object,
      'createdBy': createdByUserId,
      'createdAt': createdAt.toUtc().millisecondsSinceEpoch,
      'copiedFrom': copiedFrom,
      'parentTable': parentTable
    };
  }
}
