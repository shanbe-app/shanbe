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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Project type in your schema. */
@immutable
class Project extends Model {
  static const classType = const _ProjectModelType();
  final String id;
  final String? _uuid;
  final String? _name;
  final String? _emoji;
  final String? _color;
  final String? _cover;
  final List<Todo>? _Todos;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get uuid {
    return _uuid;
  }
  
  String? get name {
    return _name;
  }
  
  String? get emoji {
    return _emoji;
  }
  
  String? get color {
    return _color;
  }
  
  String? get cover {
    return _cover;
  }
  
  List<Todo>? get Todos {
    return _Todos;
  }
  
  const Project._internal({required this.id, uuid, name, emoji, color, cover, Todos}): _uuid = uuid, _name = name, _emoji = emoji, _color = color, _cover = cover, _Todos = Todos;
  
  factory Project({String? id, String? uuid, String? name, String? emoji, String? color, String? cover, List<Todo>? Todos}) {
    return Project._internal(
      id: id == null ? UUID.getUUID() : id,
      uuid: uuid,
      name: name,
      emoji: emoji,
      color: color,
      cover: cover,
      Todos: Todos != null ? List<Todo>.unmodifiable(Todos) : Todos);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Project &&
      id == other.id &&
      _uuid == other._uuid &&
      _name == other._name &&
      _emoji == other._emoji &&
      _color == other._color &&
      _cover == other._cover &&
      DeepCollectionEquality().equals(_Todos, other._Todos);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Project {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("uuid=" + "$_uuid" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("emoji=" + "$_emoji" + ", ");
    buffer.write("color=" + "$_color" + ", ");
    buffer.write("cover=" + "$_cover");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Project copyWith({String? id, String? uuid, String? name, String? emoji, String? color, String? cover, List<Todo>? Todos}) {
    return Project(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      color: color ?? this.color,
      cover: cover ?? this.cover,
      Todos: Todos ?? this.Todos);
  }
  
  Project.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _uuid = json['uuid'],
      _name = json['name'],
      _emoji = json['emoji'],
      _color = json['color'],
      _cover = json['cover'],
      _Todos = json['Todos'] is List
        ? (json['Todos'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Todo.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uuid': _uuid, 'name': _name, 'emoji': _emoji, 'color': _color, 'cover': _cover, 'Todos': _Todos?.map((Todo? e) => e?.toJson()).toList()
  };

  static final QueryField ID = QueryField(fieldName: "project.id");
  static final QueryField UUID = QueryField(fieldName: "uuid");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField EMOJI = QueryField(fieldName: "emoji");
  static final QueryField COLOR = QueryField(fieldName: "color");
  static final QueryField COVER = QueryField(fieldName: "cover");
  static final QueryField TODOS = QueryField(
    fieldName: "Todos",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Todo).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Project";
    modelSchemaDefinition.pluralName = "Projects";
    
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
      key: Project.UUID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Project.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Project.EMOJI,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Project.COLOR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Project.COVER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Project.TODOS,
      isRequired: false,
      ofModelName: (Todo).toString(),
      associatedKey: Todo.PROJECTID
    ));
  });
}

class _ProjectModelType extends ModelType<Project> {
  const _ProjectModelType();
  
  @override
  Project fromJson(Map<String, dynamic> jsonData) {
    return Project.fromJson(jsonData);
  }
}