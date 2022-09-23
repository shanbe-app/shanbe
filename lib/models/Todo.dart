/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Todo type in your schema. */
@immutable
class Todo extends Model {
  static const classType = const _TodoModelType();
  final String id;
  final String? _title;
  final String? _content;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final TemporalDateTime? _startDate;
  final TemporalDateTime? _dueDate;
  final TemporalDateTime? _endDate;
  final TemporalDateTime? _doneAt;
  final int? _priority;
  final String? _timezone;
  final bool? _isFloating;
  final bool? _isAllDay;
  final String? _rrule;
  final String? _projectID;
  final String? _sectionID;
  final String? _parentTodo;
  final Section? _section;
  final List<Reminder>? _reminders;
  final List<TodoTag>? _tags;
  final List<Todo>? _todos;
  final Todo? _nextItem;
  final String? _todoNextItemId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get content {
    return _content;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  TemporalDateTime? get startDate {
    return _startDate;
  }
  
  TemporalDateTime? get dueDate {
    return _dueDate;
  }
  
  TemporalDateTime? get endDate {
    return _endDate;
  }
  
  TemporalDateTime? get doneAt {
    return _doneAt;
  }
  
  int? get priority {
    return _priority;
  }
  
  String? get timezone {
    return _timezone;
  }
  
  bool? get isFloating {
    return _isFloating;
  }
  
  bool? get isAllDay {
    return _isAllDay;
  }
  
  String? get rrule {
    return _rrule;
  }
  
  String get projectID {
    try {
      return _projectID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get sectionID {
    try {
      return _sectionID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get parentTodo {
    return _parentTodo;
  }
  
  Section? get section {
    return _section;
  }
  
  List<Reminder>? get reminders {
    return _reminders;
  }
  
  List<TodoTag>? get tags {
    return _tags;
  }
  
  List<Todo>? get todos {
    return _todos;
  }
  
  Todo? get nextItem {
    return _nextItem;
  }
  
  String? get todoNextItemId {
    return _todoNextItemId;
  }
  
  const Todo._internal({required this.id, required title, content, createdAt, updatedAt, startDate, dueDate, endDate, doneAt, priority, timezone, isFloating, isAllDay, rrule, required projectID, required sectionID, parentTodo, section, reminders, tags, todos, nextItem, todoNextItemId}): _title = title, _content = content, _createdAt = createdAt, _updatedAt = updatedAt, _startDate = startDate, _dueDate = dueDate, _endDate = endDate, _doneAt = doneAt, _priority = priority, _timezone = timezone, _isFloating = isFloating, _isAllDay = isAllDay, _rrule = rrule, _projectID = projectID, _sectionID = sectionID, _parentTodo = parentTodo, _section = section, _reminders = reminders, _tags = tags, _todos = todos, _nextItem = nextItem, _todoNextItemId = todoNextItemId;
  
  factory Todo({String? id, required String title, String? content, TemporalDateTime? createdAt, TemporalDateTime? updatedAt, TemporalDateTime? startDate, TemporalDateTime? dueDate, TemporalDateTime? endDate, TemporalDateTime? doneAt, int? priority, String? timezone, bool? isFloating, bool? isAllDay, String? rrule, required String projectID, required String sectionID, String? parentTodo, Section? section, List<Reminder>? reminders, List<TodoTag>? tags, List<Todo>? todos, Todo? nextItem, String? todoNextItemId}) {
    return Todo._internal(
      id: id == null ? UUID.getUUID() : id,
      title: title,
      content: content,
      createdAt: createdAt,
      updatedAt: updatedAt,
      startDate: startDate,
      dueDate: dueDate,
      endDate: endDate,
      doneAt: doneAt,
      priority: priority,
      timezone: timezone,
      isFloating: isFloating,
      isAllDay: isAllDay,
      rrule: rrule,
      projectID: projectID,
      sectionID: sectionID,
      parentTodo: parentTodo,
      section: section,
      reminders: reminders != null ? List<Reminder>.unmodifiable(reminders) : reminders,
      tags: tags != null ? List<TodoTag>.unmodifiable(tags) : tags,
      todos: todos != null ? List<Todo>.unmodifiable(todos) : todos,
      nextItem: nextItem,
      todoNextItemId: todoNextItemId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Todo &&
      id == other.id &&
      _title == other._title &&
      _content == other._content &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _startDate == other._startDate &&
      _dueDate == other._dueDate &&
      _endDate == other._endDate &&
      _doneAt == other._doneAt &&
      _priority == other._priority &&
      _timezone == other._timezone &&
      _isFloating == other._isFloating &&
      _isAllDay == other._isAllDay &&
      _rrule == other._rrule &&
      _projectID == other._projectID &&
      _sectionID == other._sectionID &&
      _parentTodo == other._parentTodo &&
      _section == other._section &&
      DeepCollectionEquality().equals(_reminders, other._reminders) &&
      DeepCollectionEquality().equals(_tags, other._tags) &&
      DeepCollectionEquality().equals(_todos, other._todos) &&
      _nextItem == other._nextItem &&
      _todoNextItemId == other._todoNextItemId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Todo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("content=" + "$_content" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("startDate=" + (_startDate != null ? _startDate!.format() : "null") + ", ");
    buffer.write("dueDate=" + (_dueDate != null ? _dueDate!.format() : "null") + ", ");
    buffer.write("endDate=" + (_endDate != null ? _endDate!.format() : "null") + ", ");
    buffer.write("doneAt=" + (_doneAt != null ? _doneAt!.format() : "null") + ", ");
    buffer.write("priority=" + (_priority != null ? _priority!.toString() : "null") + ", ");
    buffer.write("timezone=" + "$_timezone" + ", ");
    buffer.write("isFloating=" + (_isFloating != null ? _isFloating!.toString() : "null") + ", ");
    buffer.write("isAllDay=" + (_isAllDay != null ? _isAllDay!.toString() : "null") + ", ");
    buffer.write("rrule=" + "$_rrule" + ", ");
    buffer.write("projectID=" + "$_projectID" + ", ");
    buffer.write("sectionID=" + "$_sectionID" + ", ");
    buffer.write("parentTodo=" + "$_parentTodo" + ", ");
    buffer.write("section=" + (_section != null ? _section!.toString() : "null") + ", ");
    buffer.write("todoNextItemId=" + "$_todoNextItemId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Todo copyWith({String? id, String? title, String? content, TemporalDateTime? createdAt, TemporalDateTime? updatedAt, TemporalDateTime? startDate, TemporalDateTime? dueDate, TemporalDateTime? endDate, TemporalDateTime? doneAt, int? priority, String? timezone, bool? isFloating, bool? isAllDay, String? rrule, String? projectID, String? sectionID, String? parentTodo, Section? section, List<Reminder>? reminders, List<TodoTag>? tags, List<Todo>? todos, Todo? nextItem, String? todoNextItemId}) {
    return Todo._internal(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      startDate: startDate ?? this.startDate,
      dueDate: dueDate ?? this.dueDate,
      endDate: endDate ?? this.endDate,
      doneAt: doneAt ?? this.doneAt,
      priority: priority ?? this.priority,
      timezone: timezone ?? this.timezone,
      isFloating: isFloating ?? this.isFloating,
      isAllDay: isAllDay ?? this.isAllDay,
      rrule: rrule ?? this.rrule,
      projectID: projectID ?? this.projectID,
      sectionID: sectionID ?? this.sectionID,
      parentTodo: parentTodo ?? this.parentTodo,
      section: section ?? this.section,
      reminders: reminders ?? this.reminders,
      tags: tags ?? this.tags,
      todos: todos ?? this.todos,
      nextItem: nextItem ?? this.nextItem,
      todoNextItemId: todoNextItemId ?? this.todoNextItemId);
  }
  
  Todo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _content = json['content'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _startDate = json['startDate'] != null ? TemporalDateTime.fromString(json['startDate']) : null,
      _dueDate = json['dueDate'] != null ? TemporalDateTime.fromString(json['dueDate']) : null,
      _endDate = json['endDate'] != null ? TemporalDateTime.fromString(json['endDate']) : null,
      _doneAt = json['doneAt'] != null ? TemporalDateTime.fromString(json['doneAt']) : null,
      _priority = (json['priority'] as num?)?.toInt(),
      _timezone = json['timezone'],
      _isFloating = json['isFloating'],
      _isAllDay = json['isAllDay'],
      _rrule = json['rrule'],
      _projectID = json['projectID'],
      _sectionID = json['sectionID'],
      _parentTodo = json['parentTodo'],
      _section = json['section']?['serializedData'] != null
        ? Section.fromJson(new Map<String, dynamic>.from(json['section']['serializedData']))
        : null,
      _reminders = json['reminders'] is List
        ? (json['reminders'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Reminder.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _tags = json['tags'] is List
        ? (json['tags'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => TodoTag.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _todos = json['todos'] is List
        ? (json['todos'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Todo.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _nextItem = json['nextItem']?['serializedData'] != null
        ? Todo.fromJson(new Map<String, dynamic>.from(json['nextItem']['serializedData']))
        : null,
      _todoNextItemId = json['todoNextItemId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'content': _content, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'startDate': _startDate?.format(), 'dueDate': _dueDate?.format(), 'endDate': _endDate?.format(), 'doneAt': _doneAt?.format(), 'priority': _priority, 'timezone': _timezone, 'isFloating': _isFloating, 'isAllDay': _isAllDay, 'rrule': _rrule, 'projectID': _projectID, 'sectionID': _sectionID, 'parentTodo': _parentTodo, 'section': _section?.toJson(), 'reminders': _reminders?.map((Reminder? e) => e?.toJson()).toList(), 'tags': _tags?.map((TodoTag? e) => e?.toJson()).toList(), 'todos': _todos?.map((Todo? e) => e?.toJson()).toList(), 'nextItem': _nextItem?.toJson(), 'todoNextItemId': _todoNextItemId
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField CONTENT = QueryField(fieldName: "content");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static final QueryField STARTDATE = QueryField(fieldName: "startDate");
  static final QueryField DUEDATE = QueryField(fieldName: "dueDate");
  static final QueryField ENDDATE = QueryField(fieldName: "endDate");
  static final QueryField DONEAT = QueryField(fieldName: "doneAt");
  static final QueryField PRIORITY = QueryField(fieldName: "priority");
  static final QueryField TIMEZONE = QueryField(fieldName: "timezone");
  static final QueryField ISFLOATING = QueryField(fieldName: "isFloating");
  static final QueryField ISALLDAY = QueryField(fieldName: "isAllDay");
  static final QueryField RRULE = QueryField(fieldName: "rrule");
  static final QueryField PROJECTID = QueryField(fieldName: "projectID");
  static final QueryField SECTIONID = QueryField(fieldName: "sectionID");
  static final QueryField PARENTTODO = QueryField(fieldName: "parentTodo");
  static final QueryField SECTION = QueryField(
    fieldName: "section",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Section).toString()));
  static final QueryField REMINDERS = QueryField(
    fieldName: "reminders",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Reminder).toString()));
  static final QueryField TAGS = QueryField(
    fieldName: "tags",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (TodoTag).toString()));
  static final QueryField TODOS = QueryField(
    fieldName: "todos",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Todo).toString()));
  static final QueryField NEXTITEM = QueryField(
    fieldName: "nextItem",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Todo).toString()));
  static final QueryField TODONEXTITEMID = QueryField(fieldName: "todoNextItemId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Todo";
    modelSchemaDefinition.pluralName = "Todos";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["projectID"], name: "byProject"),
      ModelIndex(fields: const ["sectionID"], name: "bySection"),
      ModelIndex(fields: const ["parentTodo"], name: "byParent")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.CONTENT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.STARTDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.DUEDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.ENDDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.DONEAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.PRIORITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.TIMEZONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.ISFLOATING,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.ISALLDAY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.RRULE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.PROJECTID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.SECTIONID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.PARENTTODO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Todo.SECTION,
      isRequired: false,
      targetName: "sectionTodosId",
      ofModelName: (Section).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Todo.REMINDERS,
      isRequired: false,
      ofModelName: (Reminder).toString(),
      associatedKey: Reminder.TODOID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Todo.TAGS,
      isRequired: false,
      ofModelName: (TodoTag).toString(),
      associatedKey: TodoTag.TODO
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Todo.TODOS,
      isRequired: false,
      ofModelName: (Todo).toString(),
      associatedKey: Todo.PARENTTODO
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Todo.NEXTITEM,
      isRequired: false,
      ofModelName: (Todo).toString(),
      associatedKey: Todo.TODOS
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.TODONEXTITEMID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _TodoModelType extends ModelType<Todo> {
  const _TodoModelType();
  
  @override
  Todo fromJson(Map<String, dynamic> jsonData) {
    return Todo.fromJson(jsonData);
  }
}