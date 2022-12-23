import 'package:client/models/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';

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
  final String parentId;
  final String? collectionId;
  final Timestamp editedAt;
  final String workspaceId;

  Block(
      {required this.type,
      this.copiedFrom,
      required this.parentTable,
      required this.parentId,
      this.collectionId,
      required this.editedAt,
      required this.workspaceId,
      required String id,
      Timestamp? createdAt,
      Timestamp? updatedAt,
      required String userId})
      : super(
            uid: userId,
            id: id,
            createdAt: createdAt ?? Timestamp.now(),
            updatedAt: updatedAt ?? Timestamp.now());

  factory Block.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    var data = snapshot.data();
    return Block(
        type: EnumToString.fromString(BlockType.values, data?['type'])!,
        parentTable: EnumToString.fromString(
            BlockParentTable.values, data?['parentTable'])!,
        parentId: data?['parentId'],
        editedAt: Timestamp.fromMillisecondsSinceEpoch(data?['editedAt']),
        createdAt: Timestamp.fromMillisecondsSinceEpoch(data?['createdAt']),
        updatedAt: Timestamp.fromMillisecondsSinceEpoch(data?['updatedAt']),
        workspaceId: data?['workspaceId'],
        collectionId: data?['collectionId'],
        copiedFrom: data?['copiedFrom'],
        id: data?['id'],
        userId: data?['uid']);
  }

  @override
  Map<String, Object?> toMap() {
    return {
      'uid': uid,
      'id': id,
      'type': EnumToString.convertToString(type),
      'copiedFrom': copiedFrom,
      'parentTable': EnumToString.convertToString(parentTable),
      'parentId': parentId,
      'collectionId': collectionId,
      'workspaceId': workspaceId,
      'editedAt': editedAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }
}
