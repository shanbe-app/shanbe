import 'package:client/shanbe_icons.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NewTaskListItem extends StatelessWidget {
  final AppLocalizations t;
  final VoidCallback onPress;
  final double? iconSize;
  final double? nameSize;

  const NewTaskListItem(
      {Key? key,
      required this.t,
      required this.onPress,
      this.iconSize,
      this.nameSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      onPressed: onPress,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Shanbe.tasklist,
              size: iconSize ?? Constants.ICON_MEDIUM_SIZE,
              color: Constants.SECONDARY_COLOR,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              t.newPage,
              style: TextStyle(
                  fontSize: nameSize ?? Constants.S1_FONT_SIZE,
                  fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                  color: placeholderColor(context)),
            )
          ]),
    );
  }
}
