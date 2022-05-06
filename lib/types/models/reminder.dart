import 'package:couchbase_lite/couchbase_lite.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:shanbe/utils/constants.dart';
import 'package:shanbe/utils/enums.dart';
import 'package:shanbe/utils/utils.dart';

class Reminder {
  static const String TYPE = 'REMINDER';
  static const String ALIAS = 'REMINDER';
  String? id;
  String? todoId;
  String? uuid;
  DateTime? date;
  TimeOfDay? time;
  ReminderStatus? status;
  String? userId;
  String? sgUserId;

  Reminder(this.date, this.time)
      : uuid = modelUuid(),
        status = ReminderStatus.INITIALIZED;

  Reminder.fromResult(Result result) {
    var reminder = result.toMap();
    id = reminder['id'];
    uuid = reminder['uuid'];
    todoId = reminder['todoId'];
    date = DateTime.fromMillisecondsSinceEpoch(reminder['date']);
    List<String> timeSplit = reminder['time'].toString().split(':');
    time = TimeOfDay(
        hour: int.parse(timeSplit[0]), minute: int.parse(timeSplit[1]));
    status =
        EnumToString.fromString(ReminderStatus.values, reminder['status']) ??
            ReminderStatus.INITIALIZED;
    userId = reminder['userId'];
    sgUserId = reminder['sgUserId'];
  }

  MutableDocument _toMutableDoc(MutableDocument doc) {
    return doc
        .setString('id', id ?? '')
        .setString('type', TYPE)
        .setString('todoId', todoId ?? '')
        .setString('uuid', uuid ?? '')
        .setInt('date', date != null ? date!.millisecondsSinceEpoch : 0)
        .setString(
            'time', time is TimeOfDay ? '${time?.hour}:${time?.minute}' : '')
        .setString('status', EnumToString.convertToString(status))
        .setString('userId', userId ?? '')
        .setString('sgUserId', sgUserId ?? '');
  }

  static Where selectReminderFields({Expression? andWhere}) {
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
      SelectResult.expression(Expression.property('todoId').from(ALIAS))
          .as('todoId'),
      SelectResult.expression(Expression.property('date').from(ALIAS))
          .as('date'),
      SelectResult.expression(Expression.property('time').from(ALIAS))
          .as('time'),
      SelectResult.expression(Expression.property('status').from(ALIAS))
          .as('status'),
      SelectResult.expression(Expression.property('userId').from(ALIAS))
          .as('userId'),
      SelectResult.expression(Expression.property('sgUserId').from(ALIAS))
          .as('sgUserId')
    ]).from(Constants.DB_NAME, as: ALIAS).where(where);
  }

  static Future<List<Reminder>> allReminders() async {
    ResultSet resultSet = await selectReminderFields().execute();
    return resultSet.allResults().map((r) => Reminder.fromResult(r)).toList();
  }

  static Future<List<Reminder>> todoReminders(String todoId) async {
    ResultSet resultSet = await selectReminderFields(
            andWhere: Expression.property('todoId')
                .equalTo(Expression.string(todoId)))
        .execute();
    return resultSet.allResults().map((r) => Reminder.fromResult(r)).toList();
  }

  Future<bool> save(Database db, String tId) async {
    todoId = tId;
    MutableDocument doc = _toMutableDoc(MutableDocument());
    bool saved = await db.saveDocument(doc);
    if (saved) {
      id = doc.id!;
    }
    return saved;
  }

  Future<bool> update(Database db) async {
    if (id == null) return false;
    Document? document = await db.document(id!);
    if (document != null) {
      MutableDocument doc = _toMutableDoc(document.toMutable());
      bool saved = await db.saveDocument(doc);
      return saved;
    }
    return false;
  }

  Future<bool> delete(Database db) async {
    if (id == null) return false;
    Document? doc = (await db.document(id!));
    if (doc != null) {
      await db.deleteDocument(id!);
      return true;
    }
    return false;
  }

  @override
  bool operator ==(o) => o is Reminder && o.uuid == uuid;
}
