import 'package:client/models/Space.dart';
import 'package:client/shanbe_icons.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SpaceDialog extends StatefulWidget {
  final AppLocalizations t;
  final EmojiParser parser;
  final Space? defaultProject;
  final Function(Space) onCreate;
  final Function(Space) onUpdate;

  SpaceDialog(this.t,
      {Key? key,
      this.defaultProject,
      required this.onCreate,
      required this.onUpdate})
      : parser = EmojiParser(),
        super(key: key);

  @override
  _SpaceDialogState createState() => _SpaceDialogState();
}

class _SpaceDialogState extends State<SpaceDialog>
    with SingleTickerProviderStateMixin {
  String projectName = '';
  String? pickedEmoji;
  bool showEmojiPicker = false;
  AnimationController? animationController;
  Animation<double>? animation;
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = CurvedAnimation(
        parent: animationController!, curve: Curves.fastOutSlowIn);
    if (widget.defaultProject != null) {
      projectName = widget.defaultProject!.name;
      pickedEmoji = widget.defaultProject!.emoji;
      textController = TextEditingController(text: widget.defaultProject!.name);
    } else {
      textController = TextEditingController();
    }
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  void updateEmojiPickerAnim() {
    if (showEmojiPicker) {
      animationController?.forward();
    } else {
      animationController?.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8),
                    shape: const CircleBorder(),
                    elevation: 4,
                  ),
                  onPressed: () {
                    setState(() {
                      showEmojiPicker = !showEmojiPicker;
                      updateEmojiPickerAnim();
                    });
                  },
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                    child: pickedEmoji != null
                        ? Text(
                            widget.parser.emojify(pickedEmoji!),
                            style: TextStyle(fontSize: 36),
                            textAlign: TextAlign.center,
                          )
                        : Icon(
                            Shanbe.bullseye,
                            size: 36,
                            color: Constants.SECONDARY_COLOR,
                          ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    maxLength: 40,
                    autofocus: true,
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: widget.t.enterProjectName,
                        counterStyle: TextStyle()),
                    textInputAction: TextInputAction.done,
                    onChanged: (name) {
                      if (name.length <= 40) {
                        setState(() {
                          projectName = name;
                        });
                      }
                    },
                    textDirection: projectName.startsWith(RegExp(r'[A-Za-z]'))
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: animation!,
              child: Column(
                children: [
                  for (var i = 0;
                      i <= (Constants.emojis.length / 5).floor();
                      i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var j = 0; j < 5; j++)
                          Constants.emojis.length > i * 5 + j
                              ? InkResponse(
                                  onTap: () {
                                    setState(() {
                                      pickedEmoji = Constants.emojis[i * 5 + j];
                                      showEmojiPicker = !showEmojiPicker;
                                      updateEmojiPickerAnim();
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      widget.parser
                                          .emojify(Constants.emojis[i * 5 + j]),
                                      style: TextStyle(
                                          fontSize: Constants.S1_FONT_SIZE),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              : Expanded(child: Container())
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ),
      title: Text(widget.defaultProject != null
          ? widget.t.editProject
          : widget.t.addProject),
      actions: [
        if (showEmojiPicker)
          TextButton(
            onPressed: () {
              setState(() {
                showEmojiPicker = !showEmojiPicker;
                pickedEmoji = null;
                updateEmojiPickerAnim();
              });
            },
            child: Text(widget.t.removeEmoji),
          )
        else ...[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(widget.t.cancel),
          ),
          ElevatedButton(
            onPressed: projectName == ''
                ? null
                : () {
                    Space? p = widget.defaultProject;
                    if (p != null) {
                      widget.onUpdate(
                          p.copyWith(name: projectName, emoji: pickedEmoji));
                    } else {
                      widget.onCreate(Space(
                        name: projectName,
                        emoji: pickedEmoji ?? '',
                      ));
                    }
                    Navigator.of(context).pop();
                  },
            child: Text(widget.defaultProject != null
                ? widget.t.edit
                : widget.t.create),
          )
        ]
      ],
    );
  }
}
