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


/** This is an auto generated class representing the Folder type in your schema. */
@immutable
class Folder extends Model {
  static const classType = const _FolderModelType();
  final String id;
  final String? _name;
  final String? _color;
  final List<TaskList>? _taskLists;
  final List<SmartTaskList>? _smartTaskLists;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get color {
    return _color;
  }
  
  List<TaskList>? get taskLists {
    return _taskLists;
  }
  
  List<SmartTaskList>? get smartTaskLists {
    return _smartTaskLists;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Folder._internal({required this.id, required name, color, taskLists, smartTaskLists, createdAt, updatedAt}): _name = name, _color = color, _taskLists = taskLists, _smartTaskLists = smartTaskLists, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Folder({String? id, required String name, String? color, List<TaskList>? taskLists, List<SmartTaskList>? smartTaskLists}) {
    return Folder._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      color: color,
      taskLists: taskLists != null ? List<TaskList>.unmodifiable(taskLists) : taskLists,
      smartTaskLists: smartTaskLists != null ? List<SmartTaskList>.unmodifiable(smartTaskLists) : smartTaskLists);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Folder &&
      id == other.id &&
      _name == other._name &&
      _color == other._color &&
      DeepCollectionEquality().equals(_taskLists, other._taskLists) &&
      DeepCollectionEquality().equals(_smartTaskLists, other._smartTaskLists);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Folder {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("color=" + "$_color" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Folder copyWith({String? id, String? name, String? color, List<TaskList>? taskLists, List<SmartTaskList>? smartTaskLists}) {
    return Folder._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      taskLists: taskLists ?? this.taskLists,
      smartTaskLists: smartTaskLists ?? this.smartTaskLists);
  }
  
  Folder.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _color = json['color'],
      _taskLists = json['taskLists'] is List
        ? (json['taskLists'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => TaskList.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _smartTaskLists = json['smartTaskLists'] is List
        ? (json['smartTaskLists'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => SmartTaskList.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'color': _color, 'taskLists': _taskLists?.map((TaskList? e) => e?.toJson()).toList(), 'smartTaskLists': _smartTaskLists?.map((SmartTaskList? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField COLOR = QueryField(fieldName: "color");
  static final QueryField TASKLISTS = QueryField(
    fieldName: "taskLists",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (TaskList).toString()));
  static final QueryField SMARTTASKLISTS = QueryField(
    fieldName: "smartTaskLists",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (SmartTaskList).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Folder";
    modelSchemaDefinition.pluralName = "Folders";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Folder.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Folder.COLOR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Folder.TASKLISTS,
      isRequired: false,
      ofModelName: (TaskList).toString(),
      associatedKey: TaskList.FOLDER
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Folder.SMARTTASKLISTS,
      isRequired: false,
      ofModelName: (SmartTaskList).toString(),
      associatedKey: SmartTaskList.FOLDERID
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

class _FolderModelType extends ModelType<Folder> {
  const _FolderModelType();
  
  @override
  Folder fromJson(Map<String, dynamic> jsonData) {
    return Folder.fromJson(jsonData);
  }
}