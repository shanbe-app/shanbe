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


/** This is an auto generated class representing the Tag type in your schema. */
@immutable
class Tag extends Model {
  static const classType = const _TagModelType();
  final String id;
  final String? _uuid;
  final String? _name;
  final String? _color;
  final List<TagTodo>? _Todos;

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
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get color {
    return _color;
  }
  
  List<TagTodo>? get Todos {
    return _Todos;
  }
  
  const Tag._internal({required this.id, required uuid, required name, color, Todos}): _uuid = uuid, _name = name, _color = color, _Todos = Todos;
  
  factory Tag({String? id, required String uuid, required String name, String? color, List<TagTodo>? Todos}) {
    return Tag._internal(
      id: id == null ? UUID.getUUID() : id,
      uuid: uuid,
      name: name,
      color: color,
      Todos: Todos != null ? List<TagTodo>.unmodifiable(Todos) : Todos);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Tag &&
      id == other.id &&
      _uuid == other._uuid &&
      _name == other._name &&
      _color == other._color &&
      DeepCollectionEquality().equals(_Todos, other._Todos);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Tag {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("uuid=" + "$_uuid" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("color=" + "$_color");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Tag copyWith({String? id, String? uuid, String? name, String? color, List<TagTodo>? Todos}) {
    return Tag(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      color: color ?? this.color,
      Todos: Todos ?? this.Todos);
  }
  
  Tag.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _uuid = json['uuid'],
      _name = json['name'],
      _color = json['color'],
      _Todos = json['Todos'] is List
        ? (json['Todos'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => TagTodo.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uuid': _uuid, 'name': _name, 'color': _color, 'Todos': _Todos?.map((TagTodo? e) => e?.toJson()).toList()
  };

  static final QueryField ID = QueryField(fieldName: "tag.id");
  static final QueryField UUID = QueryField(fieldName: "uuid");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField COLOR = QueryField(fieldName: "color");
  static final QueryField TODOS = QueryField(
    fieldName: "Todos",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (TagTodo).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Tag";
    modelSchemaDefinition.pluralName = "Tags";
    
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
      key: Tag.UUID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Tag.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Tag.COLOR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Tag.TODOS,
      isRequired: false,
      ofModelName: (TagTodo).toString(),
      associatedKey: TagTodo.TAG
    ));
  });
}

class _TagModelType extends ModelType<Tag> {
  const _TagModelType();
  
  @override
  Tag fromJson(Map<String, dynamic> jsonData) {
    return Tag.fromJson(jsonData);
  }
}