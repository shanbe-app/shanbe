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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Profile type in your schema. */
@immutable
class Profile extends Model {
  static const classType = const _ProfileModelType();
  final String id;
  final TemporalDateTime? _premium_until;
  final String? _profile_url;
  final String? _timezone;
  final String? _calendar;
  final String? _language;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalDateTime? get premium_until {
    return _premium_until;
  }
  
  String? get profile_url {
    return _profile_url;
  }
  
  String? get timezone {
    return _timezone;
  }
  
  String? get calendar {
    return _calendar;
  }
  
  String? get language {
    return _language;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Profile._internal({required this.id, premium_until, profile_url, timezone, calendar, language, createdAt, updatedAt}): _premium_until = premium_until, _profile_url = profile_url, _timezone = timezone, _calendar = calendar, _language = language, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Profile({String? id, TemporalDateTime? premium_until, String? profile_url, String? timezone, String? calendar, String? language}) {
    return Profile._internal(
      id: id == null ? UUID.getUUID() : id,
      premium_until: premium_until,
      profile_url: profile_url,
      timezone: timezone,
      calendar: calendar,
      language: language);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Profile &&
      id == other.id &&
      _premium_until == other._premium_until &&
      _profile_url == other._profile_url &&
      _timezone == other._timezone &&
      _calendar == other._calendar &&
      _language == other._language;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Profile {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("premium_until=" + (_premium_until != null ? _premium_until!.format() : "null") + ", ");
    buffer.write("profile_url=" + "$_profile_url" + ", ");
    buffer.write("timezone=" + "$_timezone" + ", ");
    buffer.write("calendar=" + "$_calendar" + ", ");
    buffer.write("language=" + "$_language" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Profile copyWith({String? id, TemporalDateTime? premium_until, String? profile_url, String? timezone, String? calendar, String? language}) {
    return Profile._internal(
      id: id ?? this.id,
      premium_until: premium_until ?? this.premium_until,
      profile_url: profile_url ?? this.profile_url,
      timezone: timezone ?? this.timezone,
      calendar: calendar ?? this.calendar,
      language: language ?? this.language);
  }
  
  Profile.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _premium_until = json['premium_until'] != null ? TemporalDateTime.fromString(json['premium_until']) : null,
      _profile_url = json['profile_url'],
      _timezone = json['timezone'],
      _calendar = json['calendar'],
      _language = json['language'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'premium_until': _premium_until?.format(), 'profile_url': _profile_url, 'timezone': _timezone, 'calendar': _calendar, 'language': _language, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "profile.id");
  static final QueryField PREMIUM_UNTIL = QueryField(fieldName: "premium_until");
  static final QueryField PROFILE_URL = QueryField(fieldName: "profile_url");
  static final QueryField TIMEZONE = QueryField(fieldName: "timezone");
  static final QueryField CALENDAR = QueryField(fieldName: "calendar");
  static final QueryField LANGUAGE = QueryField(fieldName: "language");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Profile";
    modelSchemaDefinition.pluralName = "Profiles";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Profile.PREMIUM_UNTIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Profile.PROFILE_URL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Profile.TIMEZONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Profile.CALENDAR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Profile.LANGUAGE,
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

class _ProfileModelType extends ModelType<Profile> {
  const _ProfileModelType();
  
  @override
  Profile fromJson(Map<String, dynamic> jsonData) {
    return Profile.fromJson(jsonData);
  }
}