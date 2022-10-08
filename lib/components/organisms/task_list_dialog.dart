import 'package:client/components/atoms/task_list_item.dart';
import 'package:client/components/molecules/emoji_segments.dart';
import 'package:client/components/molecules/task_lists_bottom_sheet.dart';
import 'package:client/models/TaskList.dart';
import 'package:client/rx/service_provider.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ListDialog extends StatefulWidget {
  final AppLocalizations t;
  final Function(TaskList) onCreate;

  const ListDialog(
    this.t, {
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  _ListDialogState createState() => _ListDialogState();
}

class _ListDialogState extends State<ListDialog>
    with SingleTickerProviderStateMixin {
  String projectName = '';
  String? pickedEmoji;
  bool showEmojiPicker = false;
  AnimationController? animationController;
  Animation<double>? animation;
  TextEditingController? textController;
  TaskList? parentSpace;
  TextStyle? labelTextStyle;
  TextStyle? noneTextStyle;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = CurvedAnimation(
        parent: animationController!, curve: Curves.fastOutSlowIn);
    textController = TextEditingController();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  void updateEmojiPickerAnimation() {
    if (showEmojiPicker) {
      animationController?.forward();
    } else {
      animationController?.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    labelTextStyle ??= TextStyle(
        fontWeight: Constants.REGULAR_FONT_WEIGHT,
        fontSize: Constants.S1_FONT_SIZE,
        color: textColor(context));
    noneTextStyle ??= TextStyle(
        fontWeight: Constants.REGULAR_FONT_WEIGHT,
        fontSize: Constants.S1_FONT_SIZE,
        color: placeholderColor(context));
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                widget.t.taskListNameLabel,
                style: labelTextStyle,
              ),
              const SizedBox(
                width: 32,
              ),
              Expanded(
                child: PlatformTextField(
                  autofocus: true,
                  autocorrect: false,
                  cupertino: (context, _) => CupertinoTextFieldData(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      placeholder: widget.t.listNamePlaceholder,
                      textInputAction: TextInputAction.done,
                      placeholderStyle: TextStyle(
                          fontSize: Constants.S1_FONT_SIZE,
                          color: placeholderColor(context)),
                      style: TextStyle(
                          fontSize: Constants.S1_FONT_SIZE,
                          color: textColor(context),
                          fontWeight: Constants.REGULAR_FONT_WEIGHT)),
                  onChanged: (value) {
                    setState(() {
                      projectName = value;
                    });
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          PlatformTextButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              showPlatformContentSheet(
                  context: context,
                  builder: (context) {
                    return TaskListsBottomSheet(
                      t: widget.t,
                      title: widget.t.parentListLabel,
                      onTaskListSelected: (space) {
                        setState(() {
                          parentSpace = space;
                        });
                        Navigator.pop(context);
                      },
                    );
                  });
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  widget.t.parentListLabel,
                  style: labelTextStyle,
                ),
                const Spacer(),
                parentSpace != null
                    ? TaskListItem(taskList: parentSpace!, t: widget.t)
                    : Text(
                        widget.t.none,
                        style: noneTextStyle,
                      )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          PlatformTextButton(
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                Text(
                  widget.t.listIconLabel,
                  style: labelTextStyle,
                ),
                const Spacer(),
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                    child: pickedEmoji != null
                        ? Text(
                            ServiceProvider.getInstance()
                                .emojiManager
                                .parser
                                .emojify(pickedEmoji!),
                            style: const TextStyle(
                                fontSize: Constants.ICON_MEDIUM_SIZE),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            widget.t.none,
                            style: noneTextStyle,
                          ))
              ],
            ),
            onPressed: () {
              setState(() {
                showEmojiPicker = !showEmojiPicker;
                updateEmojiPickerAnimation();
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                widget.t.listColorLabel,
                style: labelTextStyle,
              ),
              const Spacer(),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Colors.pink),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: showEmojiPicker ? 150 : 0,
            width: double.maxFinite,
            alignment: Alignment.topCenter,
            child: SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: animation!,
              child: EmojiSegments(onPickEmoji: (emoji) {
                setState(() {
                  pickedEmoji = emoji;
                  showEmojiPicker = !showEmojiPicker;
                  updateEmojiPickerAnimation();
                });
              }),
            ),
          )
        ],
      ),
      title: Text(widget.t.addList),
      actions: [
        if (showEmojiPicker)
          TextButton(
            onPressed: () {
              setState(() {
                showEmojiPicker = !showEmojiPicker;
                pickedEmoji = null;
                updateEmojiPickerAnimation();
              });
            },
            child: Text(widget.t.removeEmoji),
          )
        else ...[
          PlatformTextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(widget.t.cancel),
          ),
          PlatformElevatedButton(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            onPressed: projectName == ''
                ? null
                : () {
                    widget.onCreate(TaskList(
                      name: projectName,
                      emoji: pickedEmoji ?? '',
                    ));
                    Navigator.of(context).pop();
                  },
            child: Text(widget.t.create),
          )
        ]
      ],
    );
  }
}
