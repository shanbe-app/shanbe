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


/** This is an auto generated class representing the List type in your schema. */
@immutable
class List extends Model {
  static const classType = const _ListModelType();
  final String id;
  final String? _name;
  final List<Section>? _Sections;
  final String? _emoji;
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
  
  List<Section>? get Sections {
    return _Sections;
  }
  
  String? get emoji {
    return _emoji;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const List._internal({required this.id, name, Sections, emoji, createdAt, updatedAt}): _name = name, _Sections = Sections, _emoji = emoji, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory List({String? id, String? name, List<Section>? Sections, String? emoji}) {
    return List._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      Sections: Sections != null ? List<Section>.unmodifiable(Sections) : Sections,
      emoji: emoji);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is List &&
      id == other.id &&
      _name == other._name &&
      DeepCollectionEquality().equals(_Sections, other._Sections) &&
      _emoji == other._emoji;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("List {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("emoji=" + "$_emoji" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  List copyWith({String? id, String? name, List<Section>? Sections, String? emoji}) {
    return List._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      Sections: Sections ?? this.Sections,
      emoji: emoji ?? this.emoji);
  }
  
  List.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _Sections = json['Sections'] is List
        ? (json['Sections'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Section.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _emoji = json['emoji'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'Sections': _Sections?.map((Section? e) => e?.toJson()).toList(), 'emoji': _emoji, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField SECTIONS = QueryField(
    fieldName: "Sections",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Section).toString()));
  static final QueryField EMOJI = QueryField(fieldName: "emoji");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "List";
    modelSchemaDefinition.pluralName = "Lists";
    
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
      key: List.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: List.SECTIONS,
      isRequired: false,
      ofModelName: (Section).toString(),
      associatedKey: Section.LISTID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: List.EMOJI,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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

class _ListModelType extends ModelType<List> {
  const _ListModelType();
  
  @override
  List fromJson(Map<String, dynamic> jsonData) {
    return List.fromJson(jsonData);
  }
}