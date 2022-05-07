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
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Reminder type in your schema. */
@immutable
class Reminder extends Model {
  static const classType = const _ReminderModelType();
  final String id;
  final String? _uuid;
  final TemporalDateTime? _date;
  final TemporalDateTime? _time;
  final ReminderStatus? _status;
  final String? _todoID;
  final Todo? _Todo;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get uuid {
    return _uuid;
  }
  
  TemporalDateTime? get date {
    return _date;
  }
  
  TemporalDateTime? get time {
    return _time;
  }
  
  ReminderStatus? get status {
    return _status;
  }
  
  String get todoID {
    try {
      return _todoID!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Todo? get Todo {
    return _Todo;
  }
  
  const Reminder._internal({required this.id, uuid, date, time, status, required todoID, Todo}): _uuid = uuid, _date = date, _time = time, _status = status, _todoID = todoID, _Todo = Todo;
  
  factory Reminder({String? id, String? uuid, TemporalDateTime? date, TemporalDateTime? time, ReminderStatus? status, required String todoID, Todo? Todo}) {
    return Reminder._internal(
      id: id == null ? UUID.getUUID() : id,
      uuid: uuid,
      date: date,
      time: time,
      status: status,
      todoID: todoID,
      Todo: Todo);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reminder &&
      id == other.id &&
      _uuid == other._uuid &&
      _date == other._date &&
      _time == other._time &&
      _status == other._status &&
      _todoID == other._todoID &&
      _Todo == other._Todo;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Reminder {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("uuid=" + "$_uuid" + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("time=" + (_time != null ? _time!.format() : "null") + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("todoID=" + "$_todoID" + ", ");
    buffer.write("Todo=" + (_Todo != null ? _Todo!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Reminder copyWith({String? id, String? uuid, TemporalDateTime? date, TemporalDateTime? time, ReminderStatus? status, String? todoID, Todo? Todo}) {
    return Reminder(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      date: date ?? this.date,
      time: time ?? this.time,
      status: status ?? this.status,
      todoID: todoID ?? this.todoID,
      Todo: Todo ?? this.Todo);
  }
  
  Reminder.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _uuid = json['uuid'],
      _date = json['date'] != null ? TemporalDateTime.fromString(json['date']) : null,
      _time = json['time'] != null ? TemporalDateTime.fromString(json['time']) : null,
      _status = enumFromString<ReminderStatus>(json['status'], ReminderStatus.values),
      _todoID = json['todoID'],
      _Todo = json['Todo']?['serializedData'] != null
        ? Todo.fromJson(new Map<String, dynamic>.from(json['Todo']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uuid': _uuid, 'date': _date?.format(), 'time': _time?.format(), 'status': enumToString(_status), 'todoID': _todoID, 'Todo': _Todo?.toJson()
  };

  static final QueryField ID = QueryField(fieldName: "reminder.id");
  static final QueryField UUID = QueryField(fieldName: "uuid");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField TIME = QueryField(fieldName: "time");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField TODOID = QueryField(fieldName: "todoID");
  static final QueryField TODO = QueryField(
    fieldName: "Todo",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Todo).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Reminder";
    modelSchemaDefinition.pluralName = "Reminders";
    
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
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Reminder.UUID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Reminder.DATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Reminder.TIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Reminder.STATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Reminder.TODOID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Reminder.TODO,
      isRequired: false,
      targetName: "todoRemindersId",
      ofModelName: (Todo).toString()
    ));
  });
}

class _ReminderModelType extends ModelType<Reminder> {
  const _ReminderModelType();
  
  @override
  Reminder fromJson(Map<String, dynamic> jsonData) {
    return Reminder.fromJson(jsonData);
  }
}