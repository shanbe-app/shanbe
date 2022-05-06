import 'package:client/types/models/model.dart';
import 'package:couchbase_lite/couchbase_lite.dart';
import 'package:flutter/material.dart';
import 'package:shanbe/utils/constants.dart';
import 'package:shanbe/utils/hex_color.dart';
import 'package:shanbe/utils/utils.dart';

class Tag extends Model{
  static const String TYPE = 'TAG';
  static const String ALIAS = 'TAG';
  String? id;
  String? uuid;
  String? name;
  Color? color;
  String? userId;
  String? sgUserId;

  Tag({required this.name, required this.color}) : uuid = genUuid;

  Tag.fromResult(Result result) {
    var tag = result.toMap();
    id = tag['id'];
    uuid = tag['uuid'];
    name = tag['name'];
    color = HexColor.fromHex(tag['color']);
    userId = tag['userId'];
    sgUserId = tag['sgUserId'];
  }

  MutableDocument _toMutableDoc(MutableDocument doc) {
    return doc
        .setString('id', id ?? '')
        .setString('type', TYPE)
        .setString('uuid', uuid ?? '')
        .setString('name', name ?? '')
        .setString('color', color != null ? color!.toHex() : '')
        .setString('userId', userId ?? '')
        .setString('sgUserId', sgUserId ?? '');
  }

  static Where selectTagFields({Expression? andWhere}) {
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
      SelectResult.expression(Expression.property('name').from(ALIAS))
          .as('name'),
      SelectResult.expression(Expression.property('color').from(ALIAS))
          .as('color'),
      SelectResult.expression(Expression.property('userId').from(ALIAS))
          .as('userId'),
      SelectResult.expression(Expression.property('sgUserId').from(ALIAS))
          .as('sgUserId')
    ]).from(Constants.DB_NAME, as: ALIAS).where(where);
  }

  static Future<List<Tag>> allTags() async {
    ResultSet resultSet = await selectTagFields().execute();
    return resultSet.allResults().map((r) => Tag.fromResult(r)).toList();
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
    if(id==null) return false;
    Document? document = await db.document(id!);
    if (document != null) {
      MutableDocument doc = _toMutableDoc(document.toMutable());
      bool saved = await db.saveDocument(doc);
      return saved;
    }
    return false;
  }

  Future<bool> delete(Database db) async {
    if(id==null) return false;
    Document? document = await db.document(id!);
    if (document != null) {
      await db.deleteDocument(id!);
      return true;
    }
    return false;
  }

  @override
  bool operator ==(o) => o is Tag && o.uuid == uuid;
}
