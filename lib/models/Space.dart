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


/** This is an auto generated class representing the Space type in your schema. */
@immutable
class Space extends Model {
  static const classType = const _SpaceModelType();
  final String id;
  final String? _name;
  final String? _emoji;
  final String? _color;
  final List<Todo>? _todos;
  final String? _parentSpace;
  final List<Todo>? _spaces;
  final List<Section>? _sections;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
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
  
  List<Todo>? get todos {
    return _todos;
  }
  
  String? get parentSpace {
    return _parentSpace;
  }
  
  List<Todo>? get spaces {
    return _spaces;
  }
  
  List<Section>? get sections {
    return _sections;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Space._internal({required this.id, name, emoji, color, todos, parentSpace, spaces, sections, createdAt, updatedAt}): _name = name, _emoji = emoji, _color = color, _todos = todos, _parentSpace = parentSpace, _spaces = spaces, _sections = sections, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Space({String? id, String? name, String? emoji, String? color, List<Todo>? todos, String? parentSpace, List<Todo>? spaces, List<Section>? sections}) {
    return Space._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      emoji: emoji,
      color: color,
      todos: todos != null ? List<Todo>.unmodifiable(todos) : todos,
      parentSpace: parentSpace,
      spaces: spaces != null ? List<Todo>.unmodifiable(spaces) : spaces,
      sections: sections != null ? List<Section>.unmodifiable(sections) : sections);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Space &&
      id == other.id &&
      _name == other._name &&
      _emoji == other._emoji &&
      _color == other._color &&
      DeepCollectionEquality().equals(_todos, other._todos) &&
      _parentSpace == other._parentSpace &&
      DeepCollectionEquality().equals(_spaces, other._spaces) &&
      DeepCollectionEquality().equals(_sections, other._sections);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Space {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("emoji=" + "$_emoji" + ", ");
    buffer.write("color=" + "$_color" + ", ");
    buffer.write("parentSpace=" + "$_parentSpace" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Space copyWith({String? id, String? name, String? emoji, String? color, List<Todo>? todos, String? parentSpace, List<Todo>? spaces, List<Section>? sections}) {
    return Space._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      color: color ?? this.color,
      todos: todos ?? this.todos,
      parentSpace: parentSpace ?? this.parentSpace,
      spaces: spaces ?? this.spaces,
      sections: sections ?? this.sections);
  }
  
  Space.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _emoji = json['emoji'],
      _color = json['color'],
      _todos = json['todos'] is List
        ? (json['todos'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Todo.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _parentSpace = json['parentSpace'],
      _spaces = json['spaces'] is List
        ? (json['spaces'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Todo.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _sections = json['sections'] is List
        ? (json['sections'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Section.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'emoji': _emoji, 'color': _color, 'todos': _todos?.map((Todo? e) => e?.toJson()).toList(), 'parentSpace': _parentSpace, 'spaces': _spaces?.map((Todo? e) => e?.toJson()).toList(), 'sections': _sections?.map((Section? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField EMOJI = QueryField(fieldName: "emoji");
  static final QueryField COLOR = QueryField(fieldName: "color");
  static final QueryField TODOS = QueryField(
    fieldName: "todos",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Todo).toString()));
  static final QueryField PARENTSPACE = QueryField(fieldName: "parentSpace");
  static final QueryField SPACES = QueryField(
    fieldName: "spaces",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Todo).toString()));
  static final QueryField SECTIONS = QueryField(
    fieldName: "sections",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Section).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Space";
    modelSchemaDefinition.pluralName = "Spaces";
    
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
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["parentSpace"], name: "byParent")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Space.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Space.EMOJI,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Space.COLOR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Space.TODOS,
      isRequired: false,
      ofModelName: (Todo).toString(),
      associatedKey: Todo.SPACEID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Space.PARENTSPACE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Space.SPACES,
      isRequired: false,
      ofModelName: (Todo).toString(),
      associatedKey: Todo.PARENTTODO
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Space.SECTIONS,
      isRequired: false,
      ofModelName: (Section).toString(),
      associatedKey: Section.SPACEID
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

class _SpaceModelType extends ModelType<Space> {
  const _SpaceModelType();
  
  @override
  Space fromJson(Map<String, dynamic> jsonData) {
    return Space.fromJson(jsonData);
  }
}