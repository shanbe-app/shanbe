import 'package:client/models/TaskList.dart';
import 'package:client/rx/service_provider.dart';
import 'package:client/shanbe_icons.dart';
import 'package:client/types/hex_color.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/material.dart';

class TaskListIcon extends StatelessWidget {
  final TaskList space;
  final double size;

  const TaskListIcon(this.space,
      {Key? key, this.size = Constants.ICON_MEDIUM_SIZE})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? emoji = space.emoji;
    return emoji == null || emoji.isEmpty
        ? Icon(
            Shanbe.tasklist,
            size: size,
            color: strNotEmpty(space.color)
                ? HexColor.fromHex(space.color!)
                : grayColor(context),
          )
        : Text(
            ServiceProvider.getInstance().emojiManager.parser.emojify(emoji),
            style: TextStyle(fontSize: size),
          );
  }
}
