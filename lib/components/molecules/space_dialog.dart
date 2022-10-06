import 'package:client/models/Space.dart';
import 'package:client/rx/service_provider.dart';
import 'package:client/shanbe_icons.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SpaceDialog extends StatefulWidget {
  final AppLocalizations t;
  final Function(Space) onCreate;

  const SpaceDialog(this.t, {Key? key, required this.onCreate})
      : super(key: key);

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
  int emojiSegmentIndex = 0;

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
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              PlatformElevatedButton(
                onPressed: () {
                  setState(() {
                    showEmojiPicker = !showEmojiPicker;
                    updateEmojiPickerAnimation();
                  });
                },
                padding: EdgeInsets.zero,
                color: Constants.SECONDARY_COLOR,
                alignment: Alignment.center,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(45)),
                  child: AnimatedSwitcher(
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
                        : const Icon(
                            Shanbe.tasklist,
                            size: Constants.ICON_MEDIUM_SIZE,
                            color: Colors.white,
                          ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: PlatformTextField(
                  autofocus: true,
                  autocorrect: false,
                  cupertino: (context, _) => CupertinoTextFieldData(
                    placeholder: widget.t.spaceNamePlaceholder,
                    textInputAction: TextInputAction.done,
                  ),
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
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: false,
                itemBuilder: (context, index) => PlatformIconButton(
                  onPressed: () {
                    setState(() {
                      pickedEmoji = Constants.emojis.entries
                          .elementAt(emojiSegmentIndex)
                          .value[index];
                      showEmojiPicker = !showEmojiPicker;
                      updateEmojiPickerAnimation();
                    });
                  },
                  padding: const EdgeInsets.all(0),
                  icon: Text(
                    ServiceProvider.getInstance().emojiManager.parser.emojify(
                        Constants.emojis.entries
                            .elementAt(emojiSegmentIndex)
                            .value[index]),
                    style: const TextStyle(fontSize: Constants.H5_FONT_SIZE),
                    textAlign: TextAlign.center,
                  ),
                ),
                itemCount: Constants.emojis.entries
                    .elementAt(emojiSegmentIndex)
                    .value
                    .length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 4,
                    mainAxisExtent: 40,
                    crossAxisSpacing: 40),
              ),
            ),
          )
        ],
      ),
      title: Text(widget.t.addSpace),
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
                    widget.onCreate(Space(
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
