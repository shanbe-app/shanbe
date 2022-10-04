import 'package:client/components/atoms/space_icon.dart';
import 'package:client/models/Space.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SpaceItem extends StatelessWidget {
  final Space space;
  final VoidCallback? onPress;
  final Color? spaceNameColor;

  const SpaceItem(
      {Key? key, required this.space, this.onPress, this.spaceNameColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    return PlatformTextButton(
      padding: EdgeInsets.zero,
      onPressed: onPress,
      child: Column(
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SpaceIcon(
                  space,
                  size: Constants.ICON_SMALL_SIZE,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  space.name,
                  style: TextStyle(
                      fontSize: Constants.S1_FONT_SIZE,
                      fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                      color: spaceNameColor ?? textColor(context)),
                )
              ]),
          if (space.spaces != null && space.spaces!.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: Column(
                children: space.spaces!
                    .map((e) => SpaceItem(
                          space: e,
                          onPress: onPress,
                          spaceNameColor: spaceNameColor,
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
