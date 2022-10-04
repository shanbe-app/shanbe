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


/** This is an auto generated class representing the SpaceQueryPredicate type in your schema. */
@immutable
class SpaceQueryPredicate extends Model {
  static const classType = const _SpaceQueryPredicateModelType();
  final String id;
  final SpaceFilterLogic? _filterLogic;
  final SpaceFilterType? _filterType;
  final List<String>? _filterValue;
  final String? _parentID;
  final List<SpaceQueryPredicate>? _childQuerPredicates;
  final QueryPredicateLogic? _childQueryLogic;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  SpaceFilterLogic? get filterLogic {
    return _filterLogic;
  }
  
  SpaceFilterType? get filterType {
    return _filterType;
  }
  
  List<String>? get filterValue {
    return _filterValue;
  }
  
  String? get parentID {
    return _parentID;
  }
  
  List<SpaceQueryPredicate>? get childQuerPredicates {
    return _childQuerPredicates;
  }
  
  QueryPredicateLogic? get childQueryLogic {
    return _childQueryLogic;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const SpaceQueryPredicate._internal({required this.id, filterLogic, filterType, filterValue, parentID, childQuerPredicates, childQueryLogic, createdAt, updatedAt}): _filterLogic = filterLogic, _filterType = filterType, _filterValue = filterValue, _parentID = parentID, _childQuerPredicates = childQuerPredicates, _childQueryLogic = childQueryLogic, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory SpaceQueryPredicate({String? id, SpaceFilterLogic? filterLogic, SpaceFilterType? filterType, List<String>? filterValue, String? parentID, List<SpaceQueryPredicate>? childQuerPredicates, QueryPredicateLogic? childQueryLogic}) {
    return SpaceQueryPredicate._internal(
      id: id == null ? UUID.getUUID() : id,
      filterLogic: filterLogic,
      filterType: filterType,
      filterValue: filterValue != null ? List<String>.unmodifiable(filterValue) : filterValue,
      parentID: parentID,
      childQuerPredicates: childQuerPredicates != null ? List<SpaceQueryPredicate>.unmodifiable(childQuerPredicates) : childQuerPredicates,
      childQueryLogic: childQueryLogic);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpaceQueryPredicate &&
      id == other.id &&
      _filterLogic == other._filterLogic &&
      _filterType == other._filterType &&
      DeepCollectionEquality().equals(_filterValue, other._filterValue) &&
      _parentID == other._parentID &&
      DeepCollectionEquality().equals(_childQuerPredicates, other._childQuerPredicates) &&
      _childQueryLogic == other._childQueryLogic;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SpaceQueryPredicate {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("filterLogic=" + (_filterLogic != null ? enumToString(_filterLogic)! : "null") + ", ");
    buffer.write("filterType=" + (_filterType != null ? enumToString(_filterType)! : "null") + ", ");
    buffer.write("filterValue=" + (_filterValue != null ? _filterValue!.toString() : "null") + ", ");
    buffer.write("parentID=" + "$_parentID" + ", ");
    buffer.write("childQueryLogic=" + (_childQueryLogic != null ? enumToString(_childQueryLogic)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SpaceQueryPredicate copyWith({String? id, SpaceFilterLogic? filterLogic, SpaceFilterType? filterType, List<String>? filterValue, String? parentID, List<SpaceQueryPredicate>? childQuerPredicates, QueryPredicateLogic? childQueryLogic}) {
    return SpaceQueryPredicate._internal(
      id: id ?? this.id,
      filterLogic: filterLogic ?? this.filterLogic,
      filterType: filterType ?? this.filterType,
      filterValue: filterValue ?? this.filterValue,
      parentID: parentID ?? this.parentID,
      childQuerPredicates: childQuerPredicates ?? this.childQuerPredicates,
      childQueryLogic: childQueryLogic ?? this.childQueryLogic);
  }
  
  SpaceQueryPredicate.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _filterLogic = enumFromString<SpaceFilterLogic>(json['filterLogic'], SpaceFilterLogic.values),
      _filterType = enumFromString<SpaceFilterType>(json['filterType'], SpaceFilterType.values),
      _filterValue = json['filterValue']?.cast<String>(),
      _parentID = json['parentID'],
      _childQuerPredicates = json['childQuerPredicates'] is List
        ? (json['childQuerPredicates'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => SpaceQueryPredicate.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _childQueryLogic = enumFromString<QueryPredicateLogic>(json['childQueryLogic'], QueryPredicateLogic.values),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'filterLogic': enumToString(_filterLogic), 'filterType': enumToString(_filterType), 'filterValue': _filterValue, 'parentID': _parentID, 'childQuerPredicates': _childQuerPredicates?.map((SpaceQueryPredicate? e) => e?.toJson()).toList(), 'childQueryLogic': enumToString(_childQueryLogic), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField FILTERLOGIC = QueryField(fieldName: "filterLogic");
  static final QueryField FILTERTYPE = QueryField(fieldName: "filterType");
  static final QueryField FILTERVALUE = QueryField(fieldName: "filterValue");
  static final QueryField PARENTID = QueryField(fieldName: "parentID");
  static final QueryField CHILDQUERPREDICATES = QueryField(
    fieldName: "childQuerPredicates",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (SpaceQueryPredicate).toString()));
  static final QueryField CHILDQUERYLOGIC = QueryField(fieldName: "childQueryLogic");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SpaceQueryPredicate";
    modelSchemaDefinition.pluralName = "SpaceQueryPredicates";
    
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
      key: SpaceQueryPredicate.FILTERLOGIC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SpaceQueryPredicate.FILTERTYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SpaceQueryPredicate.FILTERVALUE,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SpaceQueryPredicate.PARENTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: SpaceQueryPredicate.CHILDQUERPREDICATES,
      isRequired: false,
      ofModelName: (SpaceQueryPredicate).toString(),
      associatedKey: SpaceQueryPredicate.PARENTID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SpaceQueryPredicate.CHILDQUERYLOGIC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
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

class _SpaceQueryPredicateModelType extends ModelType<SpaceQueryPredicate> {
  const _SpaceQueryPredicateModelType();
  
  @override
  SpaceQueryPredicate fromJson(Map<String, dynamic> jsonData) {
    return SpaceQueryPredicate.fromJson(jsonData);
  }
}