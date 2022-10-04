import 'dart:math';

import 'package:client/models/ModelProvider.dart';
import 'package:client/shanbe_icons.dart';
import 'package:client/types/hex_color.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class SpaceIcon extends StatelessWidget {
  final Space space;
  final double size;

  const SpaceIcon(this.space,
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
            EmojiParser().emojify(emoji),
            style: TextStyle(fontSize: size),
          );
  }
}
