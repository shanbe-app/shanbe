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


/** This is an auto generated class representing the TaskListQueryPredicate type in your schema. */
@immutable
class TaskListQueryPredicate extends Model {
  static const classType = const _TaskListQueryPredicateModelType();
  final String id;
  final TaskListFilterLogic? _filterLogic;
  final TaskListFilterType? _filterType;
  final List<String>? _filterValue;
  final String? _parentID;
  final List<TaskListQueryPredicate>? _childQueryPredicates;
  final QueryPredicateLogic? _childQueryPredicatesLogic;
  final SmartTaskList? _smartTaskList;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TaskListFilterLogic? get filterLogic {
    return _filterLogic;
  }
  
  TaskListFilterType? get filterType {
    return _filterType;
  }
  
  List<String>? get filterValue {
    return _filterValue;
  }
  
  String? get parentID {
    return _parentID;
  }
  
  List<TaskListQueryPredicate>? get childQueryPredicates {
    return _childQueryPredicates;
  }
  
  QueryPredicateLogic? get childQueryPredicatesLogic {
    return _childQueryPredicatesLogic;
  }
  
  SmartTaskList? get smartTaskList {
    return _smartTaskList;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const TaskListQueryPredicate._internal({required this.id, filterLogic, filterType, filterValue, parentID, childQueryPredicates, childQueryPredicatesLogic, smartTaskList, createdAt, updatedAt}): _filterLogic = filterLogic, _filterType = filterType, _filterValue = filterValue, _parentID = parentID, _childQueryPredicates = childQueryPredicates, _childQueryPredicatesLogic = childQueryPredicatesLogic, _smartTaskList = smartTaskList, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory TaskListQueryPredicate({String? id, TaskListFilterLogic? filterLogic, TaskListFilterType? filterType, List<String>? filterValue, String? parentID, List<TaskListQueryPredicate>? childQueryPredicates, QueryPredicateLogic? childQueryPredicatesLogic, SmartTaskList? smartTaskList}) {
    return TaskListQueryPredicate._internal(
      id: id == null ? UUID.getUUID() : id,
      filterLogic: filterLogic,
      filterType: filterType,
      filterValue: filterValue != null ? List<String>.unmodifiable(filterValue) : filterValue,
      parentID: parentID,
      childQueryPredicates: childQueryPredicates != null ? List<TaskListQueryPredicate>.unmodifiable(childQueryPredicates) : childQueryPredicates,
      childQueryPredicatesLogic: childQueryPredicatesLogic,
      smartTaskList: smartTaskList);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskListQueryPredicate &&
      id == other.id &&
      _filterLogic == other._filterLogic &&
      _filterType == other._filterType &&
      DeepCollectionEquality().equals(_filterValue, other._filterValue) &&
      _parentID == other._parentID &&
      DeepCollectionEquality().equals(_childQueryPredicates, other._childQueryPredicates) &&
      _childQueryPredicatesLogic == other._childQueryPredicatesLogic &&
      _smartTaskList == other._smartTaskList;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TaskListQueryPredicate {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("filterLogic=" + (_filterLogic != null ? enumToString(_filterLogic)! : "null") + ", ");
    buffer.write("filterType=" + (_filterType != null ? enumToString(_filterType)! : "null") + ", ");
    buffer.write("filterValue=" + (_filterValue != null ? _filterValue!.toString() : "null") + ", ");
    buffer.write("parentID=" + "$_parentID" + ", ");
    buffer.write("childQueryPredicatesLogic=" + (_childQueryPredicatesLogic != null ? enumToString(_childQueryPredicatesLogic)! : "null") + ", ");
    buffer.write("smartTaskList=" + (_smartTaskList != null ? _smartTaskList!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TaskListQueryPredicate copyWith({String? id, TaskListFilterLogic? filterLogic, TaskListFilterType? filterType, List<String>? filterValue, String? parentID, List<TaskListQueryPredicate>? childQueryPredicates, QueryPredicateLogic? childQueryPredicatesLogic, SmartTaskList? smartTaskList}) {
    return TaskListQueryPredicate._internal(
      id: id ?? this.id,
      filterLogic: filterLogic ?? this.filterLogic,
      filterType: filterType ?? this.filterType,
      filterValue: filterValue ?? this.filterValue,
      parentID: parentID ?? this.parentID,
      childQueryPredicates: childQueryPredicates ?? this.childQueryPredicates,
      childQueryPredicatesLogic: childQueryPredicatesLogic ?? this.childQueryPredicatesLogic,
      smartTaskList: smartTaskList ?? this.smartTaskList);
  }
  
  TaskListQueryPredicate.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _filterLogic = enumFromString<TaskListFilterLogic>(json['filterLogic'], TaskListFilterLogic.values),
      _filterType = enumFromString<TaskListFilterType>(json['filterType'], TaskListFilterType.values),
      _filterValue = json['filterValue']?.cast<String>(),
      _parentID = json['parentID'],
      _childQueryPredicates = json['childQueryPredicates'] is List
        ? (json['childQueryPredicates'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => TaskListQueryPredicate.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _childQueryPredicatesLogic = enumFromString<QueryPredicateLogic>(json['childQueryPredicatesLogic'], QueryPredicateLogic.values),
      _smartTaskList = json['smartTaskList']?['serializedData'] != null
        ? SmartTaskList.fromJson(new Map<String, dynamic>.from(json['smartTaskList']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'filterLogic': enumToString(_filterLogic), 'filterType': enumToString(_filterType), 'filterValue': _filterValue, 'parentID': _parentID, 'childQueryPredicates': _childQueryPredicates?.map((TaskListQueryPredicate? e) => e?.toJson()).toList(), 'childQueryPredicatesLogic': enumToString(_childQueryPredicatesLogic), 'smartTaskList': _smartTaskList?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField FILTERLOGIC = QueryField(fieldName: "filterLogic");
  static final QueryField FILTERTYPE = QueryField(fieldName: "filterType");
  static final QueryField FILTERVALUE = QueryField(fieldName: "filterValue");
  static final QueryField PARENTID = QueryField(fieldName: "parentID");
  static final QueryField CHILDQUERYPREDICATES = QueryField(
    fieldName: "childQueryPredicates",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (TaskListQueryPredicate).toString()));
  static final QueryField CHILDQUERYPREDICATESLOGIC = QueryField(fieldName: "childQueryPredicatesLogic");
  static final QueryField SMARTTASKLIST = QueryField(
    fieldName: "smartTaskList",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (SmartTaskList).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TaskListQueryPredicate";
    modelSchemaDefinition.pluralName = "TaskListQueryPredicates";
    
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
      ModelIndex(fields: const ["parentID"], name: "byParent")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TaskListQueryPredicate.FILTERLOGIC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TaskListQueryPredicate.FILTERTYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TaskListQueryPredicate.FILTERVALUE,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TaskListQueryPredicate.PARENTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: TaskListQueryPredicate.CHILDQUERYPREDICATES,
      isRequired: false,
      ofModelName: (TaskListQueryPredicate).toString(),
      associatedKey: TaskListQueryPredicate.PARENTID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TaskListQueryPredicate.CHILDQUERYPREDICATESLOGIC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: TaskListQueryPredicate.SMARTTASKLIST,
      isRequired: false,
      targetName: "taskListQueryPredicateSmartTaskListId",
      ofModelName: (SmartTaskList).toString()
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

class _TaskListQueryPredicateModelType extends ModelType<TaskListQueryPredicate> {
  const _TaskListQueryPredicateModelType();
  
  @override
  TaskListQueryPredicate fromJson(Map<String, dynamic> jsonData) {
    return TaskListQueryPredicate.fromJson(jsonData);
  }
}