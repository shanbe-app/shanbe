import 'package:client/components/atoms/space_item.dart';
import 'package:client/components/molecules/emoji_segments.dart';
import 'package:client/models/Space.dart';
import 'package:client/rx/blocs/space_bloc.dart';
import 'package:client/rx/service_provider.dart';
import 'package:client/shanbe_icons.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SpaceDialog extends StatefulWidget {
  final AppLocalizations t;
  final Function(Space) onCreate;

  const SpaceDialog(
    this.t, {
    Key? key,
    required this.onCreate,
  }) : super(key: key);

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
  Space? parentSpace;
  late SpaceBloc spaceBloc;
  TextStyle? labelTextStyle;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = CurvedAnimation(
        parent: animationController!, curve: Curves.fastOutSlowIn);
    textController = TextEditingController();
    spaceBloc = SpaceBloc();
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
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                widget.t.spaceNamePlaceholder,
                style: labelTextStyle,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: PlatformTextField(
                  autofocus: true,
                  autocorrect: false,
                  cupertino: (context, _) => CupertinoTextFieldData(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      placeholder: widget.t.spaceNamePlaceholder,
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
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                widget.t.parentSpace,
                style: labelTextStyle,
              ),
              const Spacer(),
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45)),
                      child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(
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
                                  style: TextStyle(color: placeholderCOl),
                                ))))
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                widget.t.spaceIcon,
                style: labelTextStyle,
              ),
              const Spacer(),
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45)),
                      child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(
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
                                  style: TextStyle(color: placeholderCOl),
                                ))))
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                widget.t.spaceColor,
                style: labelTextStyle,
              ),
              Spacer(),
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
