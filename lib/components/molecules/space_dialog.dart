import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shanbe/l10n/app_localizations.dart';
import 'package:shanbe/redux/actions/actions.dart';
import 'package:shanbe/redux/app_state.dart';
import 'package:shanbe/redux/models/project.dart';
import 'package:shanbe/utils/colors.dart';
import 'package:shanbe/utils/constants.dart';
import 'package:shanbe/utils/utils.dart';

class ProjectDialog extends StatefulWidget {
  final AppLocalizations t;
  final EmojiParser parser;
  final Project? defaultProject;

  ProjectDialog(this.t, {this.defaultProject}) : parser = EmojiParser();

  @override
  _ProjectDialogState createState() => _ProjectDialogState();
}

class _ProjectDialogState extends State<ProjectDialog>
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
    animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    animation = CurvedAnimation(
        parent: animationController!, curve: Curves.fastOutSlowIn);
    if (widget.defaultProject != null) {
      projectName = widget.defaultProject!.name!;
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
                    padding: EdgeInsets.all(8),
                    shape: CircleBorder(),
                    elevation: 4,
                    primary: surfaceOnCardColor(context),
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
                            FlutterIcons.sticker_emoji_mco,
                            size: 36,
                            color: Constants.ACCENT_COLOR,
                          ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    maxLength: 40,
                    autofocus: true,
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: widget.t.enterProjectName,
                        counterStyle:
                            TextStyle(fontFamily: currentFontName(context))),
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
                                          fontSize: Constants.LARGE_FONT),
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
          StoreConnector<AppState, _ProjectViewModel>(
            converter: (Store<AppState> store) => _ProjectViewModel(
                onUpdate: (project) =>
                    store.dispatch(EditProjectAction(project)),
                onCreate: (Project project) =>
                    store.dispatch(NewProjectAction(project))),
            builder: (BuildContext context, _ProjectViewModel vm) =>
                ElevatedButton(
              onPressed: projectName == ''
                  ? null
                  : () {
                      Project? p = widget.defaultProject;
                      if (p != null) {
                        widget.defaultProject!.name = projectName;
                        widget.defaultProject!.emoji = pickedEmoji!;
                        vm.onUpdate(p);
                      } else {
                        vm.onCreate(Project(
                          name: projectName,
                          emoji: pickedEmoji ?? '',
                        ));
                      }
                      Navigator.of(context).pop();
                    },
              child: Text(widget.defaultProject != null
                  ? widget.t.edit
                  : widget.t.create),
            ),
          )
        ]
      ],
    );
  }
}

class _ProjectViewModel {
  final Function(Project) onCreate;
  final Function(Project) onUpdate;

  _ProjectViewModel({required this.onCreate, required this.onUpdate});
}
