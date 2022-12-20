import 'package:client/models/model.dart';

enum CollectionViewType {
  table,
  board,
}

class CollectionView extends Model {
  final CollectionViewType type;
  final String createdUsed;

  CollectionView(
      {required this.type, required String userId, required this.createdUsed})
      : super(
            object: 'collectionView',
            createdByUserId: userId,
            createdAt: DateTime.now());

  @override
  Map<String, Object?> toMap() {
    return {
      'type': type,
      'object': object,
      'createdUser': createdByUserId,
      'createdAt': createdAt.toUtc().millisecondsSinceEpoch,
    };
  }
}
