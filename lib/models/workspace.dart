import 'package:client/models/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//TODO: related other models to workspace to have multiple workspaces
class WorkSpace extends Model {
  final String name;
  final List<String> readMembers;
  final List<String> editorMembers;
  final List<String> adminMembers;

  WorkSpace(
      {required String userId,
      required this.name,
      this.readMembers = const [],
      this.editorMembers = const [],
      this.adminMembers = const [],
      required String id,
      Timestamp? createdAt,
      Timestamp? updatedAt})
      : super(
            uid: userId,
            id: id,
            createdAt: createdAt ?? Timestamp.now(),
            updatedAt: updatedAt ?? Timestamp.now());
  factory WorkSpace.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    var data = snapshot.data();
    print('workspace data');
    print(data);
    return WorkSpace(
        id: data?['id'],
        userId: data?['userId'],
        name: data?['name'],
        createdAt: Timestamp.fromMillisecondsSinceEpoch(data?['createdAt']),
        updatedAt: Timestamp.fromMillisecondsSinceEpoch(data?['updatedAt']),
        readMembers: data?['readMembers'],
        editorMembers: data?['editorMembers'],
        adminMembers: data?['adminMembers']);
  }

  @override
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'uid': uid,
      'readMembers': readMembers,
      'editorMembers': editorMembers,
      'adminMembers': adminMembers,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch
    };
  }
}
