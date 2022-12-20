import 'package:client/models/model.dart';

//TODO: related other models to workspace to have multiple workspaces
class WorkSpace extends Model {
  final String name;
  final List<String> members;

  WorkSpace(
      {required String createdByUserId,
      required this.name,
      required this.members})
      : super(
            object: 'workspace',
            createdByUserId: createdByUserId,
            createdAt: DateTime.now());

  @override
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'object': object,
      'name': name,
      'members': members,
      'createdAt': createdAt,
      'createdBy': createdByUserId
    };
  }
}
