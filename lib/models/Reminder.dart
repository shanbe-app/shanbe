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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Reminder type in your schema. */
@immutable
class Reminder extends Model {
  static const classType = const _ReminderModelType();
  final String id;
  final String? _trigger;
  final ReminderStatus? _status;
  final String? _todoID;
  final Todo? _todo;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get trigger {
    try {
      return _trigger!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  ReminderStatus? get status {
    return _status;
  }
  
  String get todoID {
    try {
      return _todoID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Todo? get todo {
    return _todo;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Reminder._internal({required this.id, required trigger, status, required todoID, todo, createdAt, updatedAt}): _trigger = trigger, _status = status, _todoID = todoID, _todo = todo, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Reminder({String? id, required String trigger, ReminderStatus? status, required String todoID, Todo? todo}) {
    return Reminder._internal(
      id: id == null ? UUID.getUUID() : id,
      trigger: trigger,
      status: status,
      todoID: todoID,
      todo: todo);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reminder &&
      id == other.id &&
      _trigger == other._trigger &&
      _status == other._status &&
      _todoID == other._todoID &&
      _todo == other._todo;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Reminder {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("trigger=" + "$_trigger" + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("todoID=" + "$_todoID" + ", ");
    buffer.write("todo=" + (_todo != null ? _todo!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Reminder copyWith({String? id, String? trigger, ReminderStatus? status, String? todoID, Todo? todo}) {
    return Reminder._internal(
      id: id ?? this.id,
      trigger: trigger ?? this.trigger,
      status: status ?? this.status,
      todoID: todoID ?? this.todoID,
      todo: todo ?? this.todo);
  }
  
  Reminder.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _trigger = json['trigger'],
      _status = enumFromString<ReminderStatus>(json['status'], ReminderStatus.values),
      _todoID = json['todoID'],
      _todo = json['todo']?['serializedData'] != null
        ? Todo.fromJson(new Map<String, dynamic>.from(json['todo']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'trigger': _trigger, 'status': enumToString(_status), 'todoID': _todoID, 'todo': _todo?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "reminder.id");
  static final QueryField TRIGGER = QueryField(fieldName: "trigger");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField TODOID = QueryField(fieldName: "todoID");
  static final QueryField TODO = QueryField(
    fieldName: "todo",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Todo).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Reminder";
    modelSchemaDefinition.pluralName = "Reminders";
    
    modelSchemaDefinition.authRules = [
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
      key: Reminder.TRIGGER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
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