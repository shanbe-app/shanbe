import 'package:couchbase_lite/couchbase_lite.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:shanbe/redux/models/reminder.dart';
import 'package:shanbe/utils/constants.dart';
import 'package:shanbe/utils/enums.dart';
import 'package:shanbe/utils/utils.dart';

/*
* TYPE
* title
* description
* start_date
* start_time
* due_date
* isAllDay
* repeatFlag => RRULE:FREQ=YEARLY;INTERVAL=1
* repeatFirstDate => 2020-07-06T23:30:00.000+0000
* sortOrder
* kind => ['text',...]
* createdTime
* completedTime
* timezone
* */
class Todo {
  static const String TYPE = 'TODO';
  static const String ALIAS = 'TODOS';
  String? id;
  String? title;
  DateTime? done;
  Map<int, bool>? doneRepeat;
  String? projectId;
  DateTime? dueDate;
  DateTime? endDate;
  TimeOfDay? dueTime;
  String? uuid;
  DateTime? createdAt;
  List<Reminder>? reminders;
  int? priority; // 0=> no priority, 1=> not important 2=> important 3=> urgent
  String? note;
  String? userId;
  String? sgUserId;
  List<dynamic>? subTasks;
  List<String>? tagIds;
  RepeatType? repeatType;
  int? repeatInterval;

//  TBI
//  bool isAllDay;
//  String description;
//  String rrule;

  Todo(this.title, this.projectId,
      {this.reminders = const [],
      this.priority = 0,
      this.dueTime,
      this.dueDate,
      this.note,
      this.tagIds = const [],
      this.subTasks = const [],
      this.repeatType,
      this.repeatInterval = 0,
      this.endDate,
      this.doneRepeat = const {}})
      : uuid = modelUuid(),
        createdAt = DateTime.now();

//
//  Todo.fromTodo(Todo todo)
//      : title = todo.title,
//        projectId = todo.projectId,
//        dueDate = todo.dueDate,
//        dueTime = todo.dueTime,
//        id = todo.id,
//        done = todo.done;

  Todo.fromResult(Result result) {
    var todo = result.toMap();
    id = todo['id'];
    uuid = todo['uuid'];
    projectId = todo['projectId'];
    title = todo['title'];
    done = todo['done'] != 0
        ? DateTime.fromMillisecondsSinceEpoch(todo['done'])
        : null;
    dueDate = todo['dueDate'] != 0
        ? DateTime.fromMillisecondsSinceEpoch(todo['dueDate'])
        : null;
    createdAt = DateTime.fromMillisecondsSinceEpoch(todo['createdAt']);
    if (todo['dueTime'] != null && todo['dueTime'] != '') {
      List<String> timeSplit = todo['dueTime'].toString().split(':');
      dueTime = TimeOfDay(
          hour: int.parse(timeSplit[0]), minute: int.parse(timeSplit[1]));
    }
    priority = todo['priority'] ?? 0;
    note = todo['note'];
    userId = todo['userId'];
    sgUserId = todo['sgUserId'];
    subTasks = todo['subTasks'] ?? [];
    tagIds = List<String>.from(todo['tagIds'] ?? []);
    repeatType = strEmpty(todo['repeatType'])
        ? null
        : EnumToString.fromString(RepeatType.values, todo['repeatType']);
    repeatInterval = todo['repeatInterval'] ?? 0;
    doneRepeat = todo['doneRepeat'] != null
        ? Map<String, bool>.from(todo['doneRepeat'])
            .map((key, value) => MapEntry(int.parse(key, radix: 10), value))
        : {};
    endDate = todo['endDate'] != 0
        ? DateTime.fromMillisecondsSinceEpoch(todo['endDate'])
        : null;
  }

  MutableDocument _toMutableDoc(MutableDocument doc) {
    return doc
        .setString('id', id ?? '')
        .setList('subTasks', subTasks ?? [])
        .setString('type', TYPE)
        .setString('uuid', uuid ?? '')
        .setString('title', title ?? '')
        .setInt('createdAt', createdAt?.millisecondsSinceEpoch ?? 0)
        .setInt('done', done?.millisecondsSinceEpoch ?? 0)
        .setInt('dueDate', dueDate?.millisecondsSinceEpoch ?? 0)
        .setInt('endDate', endDate?.millisecondsSinceEpoch ?? 0)
        .setString('dueTime',
            dueTime != null ? '${dueTime?.hour}:${dueTime?.minute}' : '')
        .setString('projectId', projectId ?? '')
        .setString('note', note ?? '')
        .setInt('priority', priority ?? 0)
        .setString('userId', userId ?? '')
        .setString('sgUserId', sgUserId ?? '')
        .setString('repeatType',
            repeatType == null ? '' : EnumToString.convertToString(repeatType))
        .setInt('repeatInterval', repeatInterval ?? 0)
        .setList('tagIds', tagIds ?? [])
        .setMap(
            'doneRepeat',
            doneRepeat?.map((key, value) => MapEntry(key.toString(), value)) ??
                {});
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
      bool saved = await db.deleteDocument(id!);
      return saved;
    }
    return false;
  }

  static Future<List<Todo>> allTodos() async {
    List<Reminder> reminders = await Reminder.allReminders();
    ResultSet resultSet = await selectTodoFields().execute();
    return resultSet
        .allResults()
        .map((Result result) => Todo.fromResult(result))
        .map((todo) {
      todo.reminders =
          reminders.where((reminder) => reminder.todoId == todo.id).toList();
      return todo;
    }).toList();
  }

  static Future<List<Todo>> projectTodos(String projectId) async {
    List<Reminder> reminders = await Reminder.allReminders();
    ResultSet resultSet = await selectTodoFields(
            andWhere: Expression.property('projectId')
                .from(ALIAS)
                .equalTo(Expression.string(projectId)))
        .execute();
    return resultSet
        .allResults()
        .map((Result result) => Todo.fromResult(result))
        .map((todo) {
      todo.reminders =
          reminders.where((reminder) => reminder.todoId == todo.id).toList();
      return todo;
    }).toList();
  }

  static Where selectTodoFields({Expression? andWhere}) {
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
      SelectResult.expression(Expression.property('title').from(ALIAS))
          .as('title'),
      SelectResult.expression(Expression.property('done').from(ALIAS))
          .as('done'),
      SelectResult.expression(Expression.property('dueDate').from(ALIAS))
          .as('dueDate'),
      SelectResult.expression(Expression.property('createdAt').from(ALIAS))
          .as('createdAt'),
      SelectResult.expression(Expression.property('dueTime').from(ALIAS))
          .as('dueTime'),
      SelectResult.expression(Expression.property('endDate').from(ALIAS))
          .as('endDate'),
      SelectResult.expression(Expression.property('projectId').from(ALIAS))
          .as('projectId'),
      SelectResult.expression(Expression.property('priority').from(ALIAS))
          .as('priority'),
      SelectResult.expression(Expression.property('note').from(ALIAS))
          .as('note'),
      SelectResult.expression(Expression.property('userId').from(ALIAS))
          .as('userId'),
      SelectResult.expression(Expression.property('sgUserId').from(ALIAS))
          .as('sgUserId'),
      SelectResult.expression(Expression.property('subTasks').from(ALIAS))
          .as('subTasks'),
      SelectResult.expression(Expression.property('tagIds').from(ALIAS))
          .as('tagIds'),
      SelectResult.expression(Expression.property('repeatInterval').from(ALIAS))
          .as('repeatInterval'),
      SelectResult.expression(Expression.property('repeatType').from(ALIAS))
          .as('repeatType'),
      SelectResult.expression(Expression.property('doneRepeat').from(ALIAS))
          .as('doneRepeat')
    ]).from(Constants.DB_NAME, as: ALIAS).where(where);
  }

  @override
  bool operator ==(o) => o is Todo && o.uuid == uuid;
}
