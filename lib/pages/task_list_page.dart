import 'package:client/components/atoms/task_list_item.dart';
import 'package:client/components/molecules/task_lists_bottom_sheet.dart';
import 'package:client/rx/blocs/task_list_bloc.dart';
import 'package:client/types/task_list_page_arguments.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class TaskListPage extends StatefulWidget {
  final TaskListPageArguments arguments;
  final BuildContext context;

  const TaskListPage({Key? key, required this.arguments, required this.context})
      : super(key: key);

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  late AppLocalizations t;
  late TaskListBloc taskListBloc;

  @override
  void initState() {
    super.initState();
    taskListBloc = TaskListBloc();
    t = AppLocalizations.of(widget.context)!;
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (context, platform) => Scaffold(
        body: renderTabBody(context),
      ),
      cupertino: (context, platform) => CupertinoPageScaffold(
        key: widget.key ?? GlobalKey(),
        child: renderTabBody(context),
      ),
    );
  }

  Widget renderTabBody(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      child: Column(
        children: [
          PlatformAppBar(
            title: PlatformTextButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showPlatformContentSheet(
                    context: context,
                    builder: (context) {
                      return TaskListsBottomSheet(
                        t: t,
                        title: t.yourTaskLists,
                        onCreateSpace: (space) =>
                            taskListBloc.createTaskList(newSpace: space),
                        currentTaskList: widget.arguments.taskLists,
                        onTaskListSelected: (taskList) {
                          if (taskList.id != widget.arguments.taskLists.id) {
                            Navigator.of(context).pushNamed('/space',
                                arguments:
                                    TaskListPageArguments(taskLists: taskList));
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      );
                    });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(children: [
                    TaskListItem(
                        taskList: widget.arguments.taskLists,
                        nameColor: headingColor(context),
                        t: t)
                  ]),
                  const SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: grayColor(context),
                  )
                ],
              ),
            ),
            cupertino: (context, _) => CupertinoNavigationBarData(
              previousPageTitle: t.taskLists,
            ),
          )
        ],
      ),
    );
  }
}
