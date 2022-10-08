import 'package:client/components/atoms/bottom_sheet_scroll_indicator.dart';
import 'package:client/components/atoms/new_task_list_item.dart';
import 'package:client/components/organisms/task_list_dialog.dart';
import 'package:client/components/organisms/task_lists_list.dart';
import 'package:client/models/TaskList.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TaskListsBottomSheet extends StatelessWidget {
  final Function(TaskList)? onCreateSpace;
  final Function(TaskList) onTaskListSelected;
  final TaskList? currentTaskList;
  final AppLocalizations t;
  final String title;

  const TaskListsBottomSheet(
      {Key? key,
      this.currentTaskList,
      required this.t,
      this.onCreateSpace,
      required this.onTaskListSelected,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 32, top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const BottomSheetScrollIndicator(),
            Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: Constants.H6_FONT_SIZE,
                    color: headingColor(context),
                    fontWeight: Constants.MEDIUM_FONT_WEIGHT),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListsList(
              t: t,
              onPress: onTaskListSelected,
              nameSize: Constants.H6_FONT_SIZE,
              iconSize: Constants.ICON_MEDIUM_SIZE,
            ),
            if (onCreateSpace != null)
              NewTaskListItem(
                t: t,
                nameSize: Constants.H6_FONT_SIZE,
                iconSize: Constants.ICON_MEDIUM_SIZE,
                onPress: () {
                  showPlatformDialog(
                      context: context,
                      builder: (context) => ListDialog(
                            t,
                            onCreate: onCreateSpace!,
                          ));
                },
              )
          ],
        ),
      ),
    );
  }
}
