import 'package:client/components/atoms/space_icon.dart';
import 'package:client/models/Space.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SpaceItem extends StatelessWidget {
  final AppLocalizations t;
  final Space space;
  final VoidCallback? onPress;
  final Color? nameColor;
  final double? nameSize;
  final double? iconSize;

  const SpaceItem(
      {Key? key,
      required this.space,
      this.onPress,
      this.nameColor,
      this.nameSize,
      this.iconSize,
      required this.t})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (context, candidateItems, rejectedItems) {
        return PlatformTextButton(
          padding: EdgeInsets.zero,
          onPressed: onPress,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: [
              if (candidateItems.isNotEmpty)
                Text(
                  t.dropForSubSpace,
                  style: TextStyle(
                      fontSize: Constants.S1_FONT_SIZE,
                      fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                      color: secondaryTextColor(context)),
                ),
              Column(
                children: [
                  Opacity(
                      opacity: candidateItems.isNotEmpty ? .2 : 1,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SpaceIcon(
                              space,
                              size: iconSize ?? Constants.ICON_SMALL_SIZE,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              space.name,
                              style: TextStyle(
                                  fontSize: nameSize ?? Constants.S1_FONT_SIZE,
                                  fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                                  color: nameColor ?? textColor(context)),
                            )
                          ])),
                  if (space.spaces != null && space.spaces!.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: Column(
                        children: space.spaces!
                            .map((e) => SpaceItem(
                                space: e,
                                onPress: onPress,
                                nameColor: nameColor,
                                t: t))
                            .toList(),
                      ),
                    )
                ],
              )
            ],
          ),
        );
      },
      onAccept: (_) {
        print('accept');
      },
    );
  }
}
