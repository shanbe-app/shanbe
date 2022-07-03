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


/** This is an auto generated class representing the Section type in your schema. */
@immutable
class Section extends Model {
  static const classType = const _SectionModelType();
  final String id;
  final String? _name;
  final String? _projectID;
  final Project? _project;
  final List<Todo>? _todos;
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
  
  Project? get project {
    return _project;
  }
  
  List<Todo>? get todos {
    return _todos;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Section._internal({required this.id, required name, required projectID, project, todos, createdAt, updatedAt}): _name = name, _projectID = projectID, _project = project, _todos = todos, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Section({String? id, required String name, required String projectID, Project? project, List<Todo>? todos}) {
    return Section._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      projectID: projectID,
      project: project,
      todos: todos != null ? List<Todo>.unmodifiable(todos) : todos);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Section &&
      id == other.id &&
      _name == other._name &&
      _projectID == other._projectID &&
      _project == other._project &&
      DeepCollectionEquality().equals(_todos, other._todos);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Section {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("projectID=" + "$_projectID" + ", ");
    buffer.write("project=" + (_project != null ? _project!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Section copyWith({String? id, String? name, String? projectID, Project? project, List<Todo>? todos}) {
    return Section._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      projectID: projectID ?? this.projectID,
      project: project ?? this.project,
      todos: todos ?? this.todos);
  }
  
  Section.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _projectID = json['projectID'],
      _project = json['project']?['serializedData'] != null
        ? Project.fromJson(new Map<String, dynamic>.from(json['project']['serializedData']))
        : null,
      _todos = json['todos'] is List
        ? (json['todos'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Todo.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'projectID': _projectID, 'project': _project?.toJson(), 'todos': _todos?.map((Todo? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "section.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField PROJECTID = QueryField(fieldName: "projectID");
  static final QueryField PROJECT = QueryField(
    fieldName: "project",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Project).toString()));
  static final QueryField TODOS = QueryField(
    fieldName: "todos",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Todo).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Section";
    modelSchemaDefinition.pluralName = "Sections";
    
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
      key: Section.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Section.PROJECTID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Section.PROJECT,
      isRequired: false,
      targetName: "projectSectionsId",
      ofModelName: (Project).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Section.TODOS,
      isRequired: false,
      ofModelName: (Todo).toString(),
      associatedKey: Todo.SECTIONID
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

class _SectionModelType extends ModelType<Section> {
  const _SectionModelType();
  
  @override
  Section fromJson(Map<String, dynamic> jsonData) {
    return Section.fromJson(jsonData);
  }
}