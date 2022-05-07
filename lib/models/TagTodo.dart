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


/** This is an auto generated class representing the TagTodo type in your schema. */
@immutable
class TagTodo extends Model {
  static const classType = const _TagTodoModelType();
  final String id;
  final Todo? _todo;
  final Tag? _tag;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Todo get todo {
    try {
      return _todo!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Tag get tag {
    try {
      return _tag!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const TagTodo._internal({required this.id, required todo, required tag}): _todo = todo, _tag = tag;
  
  factory TagTodo({String? id, required Todo todo, required Tag tag}) {
    return TagTodo._internal(
      id: id == null ? UUID.getUUID() : id,
      todo: todo,
      tag: tag);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TagTodo &&
      id == other.id &&
      _todo == other._todo &&
      _tag == other._tag;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TagTodo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("todo=" + (_todo != null ? _todo!.toString() : "null") + ", ");
    buffer.write("tag=" + (_tag != null ? _tag!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TagTodo copyWith({String? id, Todo? todo, Tag? tag}) {
    return TagTodo(
      id: id ?? this.id,
      todo: todo ?? this.todo,
      tag: tag ?? this.tag);
  }
  
  TagTodo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _todo = json['todo']?['serializedData'] != null
        ? Todo.fromJson(new Map<String, dynamic>.from(json['todo']['serializedData']))
        : null,
      _tag = json['tag']?['serializedData'] != null
        ? Tag.fromJson(new Map<String, dynamic>.from(json['tag']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'todo': _todo?.toJson(), 'tag': _tag?.toJson()
  };

  static final QueryField ID = QueryField(fieldName: "tagTodo.id");
  static final QueryField TODO = QueryField(
    fieldName: "todo",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Todo).toString()));
  static final QueryField TAG = QueryField(
    fieldName: "tag",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Tag).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TagTodo";
    modelSchemaDefinition.pluralName = "TagTodos";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: TagTodo.TODO,
      isRequired: true,
      targetName: "todoID",
      ofModelName: (Todo).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: TagTodo.TAG,
      isRequired: true,
      targetName: "tagID",
      ofModelName: (Tag).toString()
    ));
  });
}

class _TagTodoModelType extends ModelType<TagTodo> {
  const _TagTodoModelType();
  
  @override
  TagTodo fromJson(Map<String, dynamic> jsonData) {
    return TagTodo.fromJson(jsonData);
  }
}