import 'package:client/models/Space.dart';
import 'package:client/types/space_page_arguments.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SpaceItem extends StatefulWidget {
  final Space space;

  const SpaceItem({Key? key, required this.space}) : super(key: key);

  @override
  State<SpaceItem> createState() => _SpaceItemState();
}

class _SpaceItemState extends State<SpaceItem> {
  late EmojiParser emojiParser;

  @override
  void initState() {
    super.initState();
    emojiParser = EmojiParser();
  }

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    return PlatformTextButton(
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      onPressed: () {
        Navigator.of(context).pushNamed('/space',
            arguments: SpacePageArguments(space: widget.space));
      },
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        if (widget.space.emoji != null)
          Text(
            parser.emojify(widget.space.emoji!),
            style: const TextStyle(fontSize: Constants.ICON_SMALL_SIZE),
          ),
        const SizedBox(
          width: 4,
        ),
        Text(
          widget.space.name,
          style: TextStyle(
              fontSize: Constants.S1_FONT_SIZE,
              fontWeight: Constants.MEDIUM_FONT_WEIGHT,
              color: textColor(context)),
        )
      ]),
    );
  }
}
