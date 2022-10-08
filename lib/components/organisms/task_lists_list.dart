import 'package:client/components/atoms/task_list_item.dart';
import 'package:client/models/ModelProvider.dart';
import 'package:client/rx/blocs/task_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ListsList extends StatefulWidget {
  final AppLocalizations t;
  final double? iconSize;
  final double? nameSize;
  final Color? nameColor;
  final Function(TaskList) onPress;

  const ListsList(
      {Key? key,
      required this.t,
      required this.onPress,
      this.iconSize,
      this.nameSize,
      this.nameColor})
      : super(key: key);

  @override
  State<ListsList> createState() => _ListsListState();
}

class _ListsListState extends State<ListsList> {
  late TaskListBloc taskListBloc;

  @override
  void initState() {
    super.initState();
    taskListBloc = TaskListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        List<TaskList>? items = snapshot.data as List<TaskList>?;
        if (items != null) {
          return Column(
            children: items
                .map((e) => TaskListItem(
                      taskList: e,
                      t: widget.t,
                      nameColor: widget.nameColor,
                      nameSize: widget.nameSize,
                      iconSize: widget.iconSize,
                      onPress: () {
                        widget.onPress(e);
                      },
                    ))
                .toList(),
          );
        }
        return PlatformCircularProgressIndicator();
      },
      stream: taskListBloc.spaces,
    );
  }
}
