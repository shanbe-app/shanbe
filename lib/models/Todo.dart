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
  final String? _uuid;
  final String? _title;
  final String? _description;
  final TemporalDateTime? _done;
  final TemporalDate? _dueDate;
  final TemporalTime? _dueTime;
  final TemporalDate? _endDate;
  final TemporalDateTime? _createdAt;
  final int? _priority;
  final RepeatType? _repeatType;
  final int? _repeatInterval;
  final List<String>? _doneRepeat;
  final TemporalDateTime? _deletedAt;
  final List<Reminder>? _Reminders;
  final String? _projectID;
  final Project? _Project;
  final List<TagTodo>? _Tags;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get uuid {
    try {
      return _uuid!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  String? get description {
    return _description;
  }
  
  TemporalDateTime? get done {
    return _done;
  }
  
  TemporalDate? get dueDate {
    return _dueDate;
  }
  
  TemporalTime? get dueTime {
    return _dueTime;
  }
  
  TemporalDate? get endDate {
    return _endDate;
  }
  
  TemporalDateTime get createdAt {
    try {
      return _createdAt!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int? get priority {
    return _priority;
  }
  
  RepeatType? get repeatType {
    return _repeatType;
  }
  
  int? get repeatInterval {
    return _repeatInterval;
  }
  
  List<String>? get doneRepeat {
    return _doneRepeat;
  }
  
  TemporalDateTime? get deletedAt {
    return _deletedAt;
  }
  
  List<Reminder>? get Reminders {
    return _Reminders;
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
  
  Project? get Project {
    return _Project;
  }
  
  List<TagTodo>? get Tags {
    return _Tags;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Todo._internal({required this.id, required uuid, required title, description, done, dueDate, dueTime, endDate, required createdAt, priority, repeatType, repeatInterval, doneRepeat, deletedAt, Reminders, required projectID, Project, Tags, updatedAt}): _uuid = uuid, _title = title, _description = description, _done = done, _dueDate = dueDate, _dueTime = dueTime, _endDate = endDate, _createdAt = createdAt, _priority = priority, _repeatType = repeatType, _repeatInterval = repeatInterval, _doneRepeat = doneRepeat, _deletedAt = deletedAt, _Reminders = Reminders, _projectID = projectID, _Project = Project, _Tags = Tags, _updatedAt = updatedAt;
  
  factory Todo({String? id, required String uuid, required String title, String? description, TemporalDateTime? done, TemporalDate? dueDate, TemporalTime? dueTime, TemporalDate? endDate, required TemporalDateTime createdAt, int? priority, RepeatType? repeatType, int? repeatInterval, List<String>? doneRepeat, TemporalDateTime? deletedAt, List<Reminder>? Reminders, required String projectID, Project? Project, List<TagTodo>? Tags}) {
    return Todo._internal(
      id: id == null ? UUID.getUUID() : id,
      uuid: uuid,
      title: title,
      description: description,
      done: done,
      dueDate: dueDate,
      dueTime: dueTime,
      endDate: endDate,
      createdAt: createdAt,
      priority: priority,
      repeatType: repeatType,
      repeatInterval: repeatInterval,
      doneRepeat: doneRepeat != null ? List<String>.unmodifiable(doneRepeat) : doneRepeat,
      deletedAt: deletedAt,
      Reminders: Reminders != null ? List<Reminder>.unmodifiable(Reminders) : Reminders,
      projectID: projectID,
      Project: Project,
      Tags: Tags != null ? List<TagTodo>.unmodifiable(Tags) : Tags);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Todo &&
      id == other.id &&
      _uuid == other._uuid &&
      _title == other._title &&
      _description == other._description &&
      _done == other._done &&
      _dueDate == other._dueDate &&
      _dueTime == other._dueTime &&
      _endDate == other._endDate &&
      _createdAt == other._createdAt &&
      _priority == other._priority &&
      _repeatType == other._repeatType &&
      _repeatInterval == other._repeatInterval &&
      DeepCollectionEquality().equals(_doneRepeat, other._doneRepeat) &&
      _deletedAt == other._deletedAt &&
      DeepCollectionEquality().equals(_Reminders, other._Reminders) &&
      _projectID == other._projectID &&
      _Project == other._Project &&
      DeepCollectionEquality().equals(_Tags, other._Tags);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Todo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("uuid=" + "$_uuid" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("done=" + (_done != null ? _done!.format() : "null") + ", ");
    buffer.write("dueDate=" + (_dueDate != null ? _dueDate!.format() : "null") + ", ");
    buffer.write("dueTime=" + (_dueTime != null ? _dueTime!.format() : "null") + ", ");
    buffer.write("endDate=" + (_endDate != null ? _endDate!.format() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("priority=" + (_priority != null ? _priority!.toString() : "null") + ", ");
    buffer.write("repeatType=" + (_repeatType != null ? enumToString(_repeatType)! : "null") + ", ");
    buffer.write("repeatInterval=" + (_repeatInterval != null ? _repeatInterval!.toString() : "null") + ", ");
    buffer.write("doneRepeat=" + (_doneRepeat != null ? _doneRepeat!.toString() : "null") + ", ");
    buffer.write("deletedAt=" + (_deletedAt != null ? _deletedAt!.format() : "null") + ", ");
    buffer.write("projectID=" + "$_projectID" + ", ");
    buffer.write("Project=" + (_Project != null ? _Project!.toString() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Todo copyWith({String? id, String? uuid, String? title, String? description, TemporalDateTime? done, TemporalDate? dueDate, TemporalTime? dueTime, TemporalDate? endDate, TemporalDateTime? createdAt, int? priority, RepeatType? repeatType, int? repeatInterval, List<String>? doneRepeat, TemporalDateTime? deletedAt, List<Reminder>? Reminders, String? projectID, Project? Project, List<TagTodo>? Tags}) {
    return Todo._internal(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      description: description ?? this.description,
      done: done ?? this.done,
      dueDate: dueDate ?? this.dueDate,
      dueTime: dueTime ?? this.dueTime,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      priority: priority ?? this.priority,
      repeatType: repeatType ?? this.repeatType,
      repeatInterval: repeatInterval ?? this.repeatInterval,
      doneRepeat: doneRepeat ?? this.doneRepeat,
      deletedAt: deletedAt ?? this.deletedAt,
      Reminders: Reminders ?? this.Reminders,
      projectID: projectID ?? this.projectID,
      Project: Project ?? this.Project,
      Tags: Tags ?? this.Tags);
  }
  
  Todo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _uuid = json['uuid'],
      _title = json['title'],
      _description = json['description'],
      _done = json['done'] != null ? TemporalDateTime.fromString(json['done']) : null,
      _dueDate = json['dueDate'] != null ? TemporalDate.fromString(json['dueDate']) : null,
      _dueTime = json['dueTime'] != null ? TemporalTime.fromString(json['dueTime']) : null,
      _endDate = json['endDate'] != null ? TemporalDate.fromString(json['endDate']) : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _priority = (json['priority'] as num?)?.toInt(),
      _repeatType = enumFromString<RepeatType>(json['repeatType'], RepeatType.values),
      _repeatInterval = (json['repeatInterval'] as num?)?.toInt(),
      _doneRepeat = json['doneRepeat']?.cast<String>(),
      _deletedAt = json['deletedAt'] != null ? TemporalDateTime.fromString(json['deletedAt']) : null,
      _Reminders = json['Reminders'] is List
        ? (json['Reminders'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Reminder.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _projectID = json['projectID'],
      _Project = json['Project']?['serializedData'] != null
        ? Project.fromJson(new Map<String, dynamic>.from(json['Project']['serializedData']))
        : null,
      _Tags = json['Tags'] is List
        ? (json['Tags'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => TagTodo.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uuid': _uuid, 'title': _title, 'description': _description, 'done': _done?.format(), 'dueDate': _dueDate?.format(), 'dueTime': _dueTime?.format(), 'endDate': _endDate?.format(), 'createdAt': _createdAt?.format(), 'priority': _priority, 'repeatType': enumToString(_repeatType), 'repeatInterval': _repeatInterval, 'doneRepeat': _doneRepeat, 'deletedAt': _deletedAt?.format(), 'Reminders': _Reminders?.map((Reminder? e) => e?.toJson()).toList(), 'projectID': _projectID, 'Project': _Project?.toJson(), 'Tags': _Tags?.map((TagTodo? e) => e?.toJson()).toList(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "todo.id");
  static final QueryField UUID = QueryField(fieldName: "uuid");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField DONE = QueryField(fieldName: "done");
  static final QueryField DUEDATE = QueryField(fieldName: "dueDate");
  static final QueryField DUETIME = QueryField(fieldName: "dueTime");
  static final QueryField ENDDATE = QueryField(fieldName: "endDate");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField PRIORITY = QueryField(fieldName: "priority");
  static final QueryField REPEATTYPE = QueryField(fieldName: "repeatType");
  static final QueryField REPEATINTERVAL = QueryField(fieldName: "repeatInterval");
  static final QueryField DONEREPEAT = QueryField(fieldName: "doneRepeat");
  static final QueryField DELETEDAT = QueryField(fieldName: "deletedAt");
  static final QueryField REMINDERS = QueryField(
    fieldName: "Reminders",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Reminder).toString()));
  static final QueryField PROJECTID = QueryField(fieldName: "projectID");
  static final QueryField PROJECT = QueryField(
    fieldName: "Project",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Project).toString()));
  static final QueryField TAGS = QueryField(
    fieldName: "Tags",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (TagTodo).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Todo";
    modelSchemaDefinition.pluralName = "Todos";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.UUID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.DONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.DUEDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.DUETIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.ENDDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.CREATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.PRIORITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.REPEATTYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.REPEATINTERVAL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.DONEREPEAT,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.DELETEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Todo.REMINDERS,
      isRequired: false,
      ofModelName: (Reminder).toString(),
      associatedKey: Reminder.TODOID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todo.PROJECTID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Todo.PROJECT,
      isRequired: false,
      targetName: "projectTodosId",
      ofModelName: (Project).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Todo.TAGS,
      isRequired: false,
      ofModelName: (TagTodo).toString(),
      associatedKey: TagTodo.TODO
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
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