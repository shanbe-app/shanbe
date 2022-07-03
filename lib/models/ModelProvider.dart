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
import 'Preferences.dart';
import 'Project.dart';
import 'Reminder.dart';
import 'Section.dart';
import 'Tag.dart';
import 'Todo.dart';
import 'TodoTag.dart';

export 'Preferences.dart';
export 'Project.dart';
export 'Reminder.dart';
export 'ReminderStatus.dart';
export 'Section.dart';
export 'Tag.dart';
export 'Todo.dart';
export 'TodoTag.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "4a671c0083c023a02f454b66228e5b6b";
  @override
  List<ModelSchema> modelSchemas = [Preferences.schema, Project.schema, Reminder.schema, Section.schema, Tag.schema, Todo.schema, TodoTag.schema];
  static final ModelProvider _instance = ModelProvider();
  @override
  List<ModelSchema> customTypeSchemas = [];

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "Preferences":
        return Preferences.classType;
      case "Project":
        return Project.classType;
      case "Reminder":
        return Reminder.classType;
      case "Section":
        return Section.classType;
      case "Tag":
        return Tag.classType;
      case "Todo":
        return Todo.classType;
      case "TodoTag":
        return TodoTag.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}