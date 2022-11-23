import 'package:client/components/atoms/task_list_icon.dart';
import 'package:client/models/TaskList.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskListItem extends StatelessWidget {
  final AppLocalizations t;
  final TaskList taskList;
  final VoidCallback? onPress;
  final Color? nameColor;
  final double? nameSize;
  final double? iconSize;

  const TaskListItem(
      {Key? key,
      required this.taskList,
      this.onPress,
      this.nameColor,
      this.nameSize,
      this.iconSize,
      required this.t})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (context, candidateItems, rejectedItems) {
        return PlatformTextButton(
          padding: EdgeInsets.zero,
          onPressed: onPress,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: [
              if (candidateItems.isNotEmpty)
                Text(
                  t.dropForSubTaskList,
                  style: TextStyle(
                      fontSize: Constants.S1_FONT_SIZE,
                      fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                      color: secondaryTextColor(context)),
                ),
              Column(
                children: [
                  Opacity(
                      opacity: candidateItems.isNotEmpty ? .2 : 1,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TaskListIcon(
                              taskList,
                              size: iconSize ?? Constants.ICON_SMALL_SIZE,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              taskList.name,
                              style: TextStyle(
                                  fontSize: nameSize ?? Constants.S1_FONT_SIZE,
                                  fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                                  color: nameColor ?? textColor(context)),
                            )
                          ])),
                  if (taskList.childTaskLists != null &&
                      taskList.childTaskLists!.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: Column(
                        children: taskList.childTaskLists!
                            .map((e) => TaskListItem(
                                taskList: e,
                                onPress: onPress,
                                nameColor: nameColor,
                                t: t))
                            .toList(),
                      ),
                    )
                ],
              )
            ],
          ),
        );
      },
      onAccept: (_) {
        //  TODO do something with task drag
      },
    );
  }
}
