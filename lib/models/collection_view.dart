import 'package:client/models/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';

enum CollectionViewType {
  table,
  board,
}

class CollectionView extends Model {
  final CollectionViewType type;

  CollectionView(
      {required this.type,
      required String userId,
      Timestamp? createdAt,
      Timestamp? updatedAt,
      required String id})
      : super(
            uid: userId,
            createdAt: createdAt ?? Timestamp.now(),
            updatedAt: updatedAt ?? Timestamp.now(),
            id: id);

  factory CollectionView.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    var data = snapshot.data();
    print('collection view data');
    print(data);
    return CollectionView(
      id: data?['id'],
      userId: data?['uid'],
      type: EnumToString.fromString(CollectionViewType.values, data?['type'])!,
      createdAt: Timestamp.fromMillisecondsSinceEpoch(data?['createdAt']),
      updatedAt: Timestamp.fromMillisecondsSinceEpoch(data?['updatedAt']),
    );
  }

  @override
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'type': EnumToString.convertToString(type),
      'uid': uid,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch
    };
  }
}
