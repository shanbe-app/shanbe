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
import 'Folder.dart';
import 'Preferences.dart';
import 'Reminder.dart';
import 'Section.dart';
import 'SmartTaskList.dart';
import 'Tag.dart';
import 'TaskList.dart';
import 'TaskListQueryPredicate.dart';
import 'Todo.dart';
import 'TodoTag.dart';

export 'CalendarType.dart';
export 'Folder.dart';
export 'Preferences.dart';
export 'PriorityType.dart';
export 'QueryPredicateLogic.dart';
export 'Reminder.dart';
export 'ReminderStatus.dart';
export 'Section.dart';
export 'SmartTaskList.dart';
export 'StartOfTheWeekType.dart';
export 'StaticTaskListType.dart';
export 'Tag.dart';
export 'TaskList.dart';
export 'TaskListFilterLogic.dart';
export 'TaskListFilterType.dart';
export 'TaskListQueryPredicate.dart';
export 'ThemeType.dart';
export 'Todo.dart';
export 'TodoTag.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "4b82431cd2bbd699257286b3eb626269";
  @override
  List<ModelSchema> modelSchemas = [Folder.schema, Preferences.schema, Reminder.schema, Section.schema, SmartTaskList.schema, Tag.schema, TaskList.schema, TaskListQueryPredicate.schema, Todo.schema, TodoTag.schema];
  static final ModelProvider _instance = ModelProvider();
  @override
  List<ModelSchema> customTypeSchemas = [];

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "Folder":
        return Folder.classType;
      case "Preferences":
        return Preferences.classType;
      case "Reminder":
        return Reminder.classType;
      case "Section":
        return Section.classType;
      case "SmartTaskList":
        return SmartTaskList.classType;
      case "Tag":
        return Tag.classType;
      case "TaskList":
        return TaskList.classType;
      case "TaskListQueryPredicate":
        return TaskListQueryPredicate.classType;
      case "Todo":
        return Todo.classType;
      case "TodoTag":
        return TodoTag.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}