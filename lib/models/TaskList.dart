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


/** This is an auto generated class representing the TaskList type in your schema. */
@immutable
class TaskList extends Model {
  static const classType = const _TaskListModelType();
  final String id;
  final String? _name;
  final String? _emoji;
  final String? _color;
  final List<Todo>? _todos;
  final List<Section>? _sections;
  final String? _parentID;
  final List<TaskList>? _childTaskLists;
  final Folder? _folder;
  final bool? _showOverDue;
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
  
  String? get emoji {
    return _emoji;
  }
  
  String? get color {
    return _color;
  }
  
  List<Todo>? get todos {
    return _todos;
  }
  
  List<Section>? get sections {
    return _sections;
  }
  
  String? get parentID {
    return _parentID;
  }
  
  List<TaskList>? get childTaskLists {
    return _childTaskLists;
  }
  
  Folder? get folder {
    return _folder;
  }
  
  bool? get showOverDue {
    return _showOverDue;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const TaskList._internal({required this.id, required name, emoji, color, todos, sections, parentID, childTaskLists, folder, showOverDue, createdAt, updatedAt}): _name = name, _emoji = emoji, _color = color, _todos = todos, _sections = sections, _parentID = parentID, _childTaskLists = childTaskLists, _folder = folder, _showOverDue = showOverDue, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory TaskList({String? id, required String name, String? emoji, String? color, List<Todo>? todos, List<Section>? sections, String? parentID, List<TaskList>? childTaskLists, Folder? folder, bool? showOverDue, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return TaskList._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      emoji: emoji,
      color: color,
      todos: todos != null ? List<Todo>.unmodifiable(todos) : todos,
      sections: sections != null ? List<Section>.unmodifiable(sections) : sections,
      parentID: parentID,
      childTaskLists: childTaskLists != null ? List<TaskList>.unmodifiable(childTaskLists) : childTaskLists,
      folder: folder,
      showOverDue: showOverDue,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskList &&
      id == other.id &&
      _name == other._name &&
      _emoji == other._emoji &&
      _color == other._color &&
      DeepCollectionEquality().equals(_todos, other._todos) &&
      DeepCollectionEquality().equals(_sections, other._sections) &&
      _parentID == other._parentID &&
      DeepCollectionEquality().equals(_childTaskLists, other._childTaskLists) &&
      _folder == other._folder &&
      _showOverDue == other._showOverDue &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TaskList {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("emoji=" + "$_emoji" + ", ");
    buffer.write("color=" + "$_color" + ", ");
    buffer.write("parentID=" + "$_parentID" + ", ");
    buffer.write("folder=" + (_folder != null ? _folder!.toString() : "null") + ", ");
    buffer.write("showOverDue=" + (_showOverDue != null ? _showOverDue!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TaskList copyWith({String? id, String? name, String? emoji, String? color, List<Todo>? todos, List<Section>? sections, String? parentID, List<TaskList>? childTaskLists, Folder? folder, bool? showOverDue, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return TaskList._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      color: color ?? this.color,
      todos: todos ?? this.todos,
      sections: sections ?? this.sections,
      parentID: parentID ?? this.parentID,
      childTaskLists: childTaskLists ?? this.childTaskLists,
      folder: folder ?? this.folder,
      showOverDue: showOverDue ?? this.showOverDue,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  TaskList.fromJson(Map<String, dynamic> json)  
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
      _sections = json['sections'] is List
        ? (json['sections'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Section.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _parentID = json['parentID'],
      _childTaskLists = json['childTaskLists'] is List
        ? (json['childTaskLists'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => TaskList.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _folder = json['folder']?['serializedData'] != null
        ? Folder.fromJson(new Map<String, dynamic>.from(json['folder']['serializedData']))
        : null,
      _showOverDue = json['showOverDue'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'emoji': _emoji, 'color': _color, 'todos': _todos?.map((Todo? e) => e?.toJson()).toList(), 'sections': _sections?.map((Section? e) => e?.toJson()).toList(), 'parentID': _parentID, 'childTaskLists': _childTaskLists?.map((TaskList? e) => e?.toJson()).toList(), 'folder': _folder?.toJson(), 'showOverDue': _showOverDue, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField EMOJI = QueryField(fieldName: "emoji");
  static final QueryField COLOR = QueryField(fieldName: "color");
  static final QueryField TODOS = QueryField(
    fieldName: "todos",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Todo).toString()));
  static final QueryField SECTIONS = QueryField(
    fieldName: "sections",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Section).toString()));
  static final QueryField PARENTID = QueryField(fieldName: "parentID");
  static final QueryField CHILDTASKLISTS = QueryField(
    fieldName: "childTaskLists",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (TaskList).toString()));
  static final QueryField FOLDER = QueryField(
    fieldName: "folder",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Folder).toString()));
  static final QueryField SHOWOVERDUE = QueryField(fieldName: "showOverDue");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TaskList";
    modelSchemaDefinition.pluralName = "TaskLists";
    
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
      ModelIndex(fields: const ["parentID"], name: "byParent"),
      ModelIndex(fields: const ["folderID"], name: "byFolder")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TaskList.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TaskList.EMOJI,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TaskList.COLOR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: TaskList.TODOS,
      isRequired: false,
      ofModelName: (Todo).toString(),
      associatedKey: Todo.TASKLIST
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: TaskList.SECTIONS,
      isRequired: false,
      ofModelName: (Section).toString(),
      associatedKey: Section.TASKLIST
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TaskList.PARENTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: TaskList.CHILDTASKLISTS,
      isRequired: false,
      ofModelName: (TaskList).toString(),
      associatedKey: TaskList.PARENTID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: TaskList.FOLDER,
      isRequired: false,
      targetName: "folderID",
      ofModelName: (Folder).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TaskList.SHOWOVERDUE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TaskList.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TaskList.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _TaskListModelType extends ModelType<TaskList> {
  const _TaskListModelType();
  
  @override
  TaskList fromJson(Map<String, dynamic> jsonData) {
    return TaskList.fromJson(jsonData);
  }
}