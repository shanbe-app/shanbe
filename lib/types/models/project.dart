import 'package:client/types/models/model.dart';
import 'package:couchbase_lite/couchbase_lite.dart';
import 'package:flutter/material.dart';

class Project extends Model {
  String id = '';
  String? name;
  String? emoji;
  String? uuid;
  String? userId;
  String? sgUserId;
  Color? color;
  String? cover;

  Project({required this.name, this.emoji}){
    uuid = genUuid;
    TYPE = 'PROJECT';
    ALIAS = 'PROJECTS';
  }

  Project.fromResult(Result result) {
    var project = result.toMap();
    id = project['id'];
    name = project['name'];
    emoji = project['emoji'];
    uuid = project['uuid'];
    userId = project['userId'];
    sgUserId = project['sgUserId'];
    color = strNotEmpty(project['color'])
        ? HexColor.fromHex(project['color'])
        : null;
    cover = strNotEmpty(project['cover']) ? project['cover'] : null;
  }

  MutableDocument _toMutableDoc(MutableDocument doc) {
    String? uId = userId;
    Color? c = color;
    String? sg = sgUserId;
    String? cv = cover;
    String? em = emoji;
    return doc
        .setString('type', TYPE)
        .setString('name', name ?? '')
        .setString('emoji', em ?? '')
        .setString('uuid', uuid ?? '')
        .setString('userId', uId ?? '')
        .setString('color', c != null ? c.toHex() : '')
        .setString('cover', cv ?? '')
        .setString('sgUserId', sg ?? '');
  }

  Future<bool> save(Database db) async {
    MutableDocument doc = _toMutableDoc(MutableDocument());
    bool saved = await db.saveDocument(doc);
    if (saved) {
      id = doc.id!;
    }
    return saved;
  }

  Future<bool> update(Database db) async {
    Document? document = await db.document(id);
    if (document != null) {
      MutableDocument doc = _toMutableDoc(document.toMutable());
      bool saved = await db.saveDocument(doc);
      return saved;
    }
    return false;
  }

  static Future<Project?> indexProject() async {
    ResultSet resultSet = await selectProjectFields(
            andWhere: Expression.property('name')
                .from(ALIAS)
                .equalTo(Expression.string(Constants.INDEX_PROJECT_NAME)))
        .execute();
    if (resultSet.isEmpty) return null;
    return Project.fromResult(resultSet.first);
  }

  static Future<List<Project>> allProjects() async {
    ResultSet resultSet = await selectProjectFields().execute();
    return resultSet
        .allResults()
        .map((Result result) => Project.fromResult(result))
        .toList();
  }

  static Where selectProjectFields({Expression? andWhere}) {
    Expression where = Expression.property('type')
        .from(ALIAS)
        .equalTo(Expression.string(TYPE));
    if (andWhere != null) {
      where = where.and(andWhere);
    }
    return QueryBuilder.select([
      SelectResult.expression(Meta.id.from(ALIAS)).as('id'),
      SelectResult.expression(Expression.property('uuid').from(ALIAS))
          .as('uuid'),
      SelectResult.expression(Expression.property('type').from(ALIAS))
          .as('type'),
      SelectResult.expression(Expression.property('name').from(ALIAS))
          .as('name'),
      SelectResult.expression(Expression.property('emoji').from(ALIAS))
          .as('emoji'),
      SelectResult.expression(Expression.property('color').from(ALIAS))
          .as('color'),
      SelectResult.expression(Expression.property('cover').from(ALIAS))
          .as('cover'),
      SelectResult.expression(Expression.property('userId').from(ALIAS))
          .as('userId'),
      SelectResult.expression(Expression.property('sgUserId').from(ALIAS))
          .as('sgUserId')
    ]).from(Constants.DB_NAME, as: ALIAS).where(where);
  }

  Future<bool> delete(Database db) async {
    Document? doc = await db.document(id);
    if (doc != null) {
      await db.deleteDocument(id);
      return true;
    }
    return false;
  }

  @override
  bool operator ==(o) => o is Project && o.uuid == uuid;
}
