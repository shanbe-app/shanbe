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


/** This is an auto generated class representing the Preferences type in your schema. */
@immutable
class Preferences extends Model {
  static const classType = const _PreferencesModelType();
  final String id;
  final ThemeType? _theme;
  final CalendarType? _calendar;
  final List<StaticTaskListType>? _visibleStaticTaskLists;
  final StartOfTheWeekType? _startOfTheWeek;
  final String? _locale;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  ThemeType? get theme {
    return _theme;
  }
  
  CalendarType? get calendar {
    return _calendar;
  }
  
  List<StaticTaskListType>? get visibleStaticTaskLists {
    return _visibleStaticTaskLists;
  }
  
  StartOfTheWeekType? get startOfTheWeek {
    return _startOfTheWeek;
  }
  
  String? get locale {
    return _locale;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Preferences._internal({required this.id, theme, calendar, visibleStaticTaskLists, startOfTheWeek, locale, createdAt, updatedAt}): _theme = theme, _calendar = calendar, _visibleStaticTaskLists = visibleStaticTaskLists, _startOfTheWeek = startOfTheWeek, _locale = locale, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Preferences({String? id, ThemeType? theme, CalendarType? calendar, List<StaticTaskListType>? visibleStaticTaskLists, StartOfTheWeekType? startOfTheWeek, String? locale, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return Preferences._internal(
      id: id == null ? UUID.getUUID() : id,
      theme: theme,
      calendar: calendar,
      visibleStaticTaskLists: visibleStaticTaskLists != null ? List<StaticTaskListType>.unmodifiable(visibleStaticTaskLists) : visibleStaticTaskLists,
      startOfTheWeek: startOfTheWeek,
      locale: locale,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Preferences &&
      id == other.id &&
      _theme == other._theme &&
      _calendar == other._calendar &&
      DeepCollectionEquality().equals(_visibleStaticTaskLists, other._visibleStaticTaskLists) &&
      _startOfTheWeek == other._startOfTheWeek &&
      _locale == other._locale &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Preferences {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("theme=" + (_theme != null ? enumToString(_theme)! : "null") + ", ");
    buffer.write("calendar=" + (_calendar != null ? enumToString(_calendar)! : "null") + ", ");
    buffer.write("visibleStaticTaskLists=" + (_visibleStaticTaskLists != null ? _visibleStaticTaskLists!.map((e) => enumToString(e)).toString() : "null") + ", ");
    buffer.write("startOfTheWeek=" + (_startOfTheWeek != null ? enumToString(_startOfTheWeek)! : "null") + ", ");
    buffer.write("locale=" + "$_locale" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Preferences copyWith({String? id, ThemeType? theme, CalendarType? calendar, List<StaticTaskListType>? visibleStaticTaskLists, StartOfTheWeekType? startOfTheWeek, String? locale, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return Preferences._internal(
      id: id ?? this.id,
      theme: theme ?? this.theme,
      calendar: calendar ?? this.calendar,
      visibleStaticTaskLists: visibleStaticTaskLists ?? this.visibleStaticTaskLists,
      startOfTheWeek: startOfTheWeek ?? this.startOfTheWeek,
      locale: locale ?? this.locale,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  Preferences.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _theme = enumFromString<ThemeType>(json['theme'], ThemeType.values),
      _calendar = enumFromString<CalendarType>(json['calendar'], CalendarType.values),
      _visibleStaticTaskLists = json['visibleStaticTaskLists'] is List
        ? (json['visibleStaticTaskLists'] as List)
          .map((e) => enumFromString<StaticTaskListType>(e, StaticTaskListType.values)!)
          .toList()
        : null,
      _startOfTheWeek = enumFromString<StartOfTheWeekType>(json['startOfTheWeek'], StartOfTheWeekType.values),
      _locale = json['locale'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'theme': enumToString(_theme), 'calendar': enumToString(_calendar), 'visibleStaticTaskLists': _visibleStaticTaskLists?.map((e) => enumToString(e)).toList(), 'startOfTheWeek': enumToString(_startOfTheWeek), 'locale': _locale, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField THEME = QueryField(fieldName: "theme");
  static final QueryField CALENDAR = QueryField(fieldName: "calendar");
  static final QueryField VISIBLESTATICTASKLISTS = QueryField(fieldName: "visibleStaticTaskLists");
  static final QueryField STARTOFTHEWEEK = QueryField(fieldName: "startOfTheWeek");
  static final QueryField LOCALE = QueryField(fieldName: "locale");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Preferences";
    modelSchemaDefinition.pluralName = "Preferences";
    
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
      key: Preferences.THEME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Preferences.CALENDAR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Preferences.VISIBLESTATICTASKLISTS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.enumeration))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Preferences.STARTOFTHEWEEK,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Preferences.LOCALE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Preferences.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Preferences.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _PreferencesModelType extends ModelType<Preferences> {
  const _PreferencesModelType();
  
  @override
  Preferences fromJson(Map<String, dynamic> jsonData) {
    return Preferences.fromJson(jsonData);
  }
}