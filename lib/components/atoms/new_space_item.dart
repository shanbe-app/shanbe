import 'package:client/shanbe_icons.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NewSpaceItem extends StatelessWidget {
  final AppLocalizations t;
  final VoidCallback onPress;

  const NewSpaceItem({Key? key, required this.t, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      onPressed: onPress,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Icon(
          Shanbe.list_add,
          size: Constants.ICON_MEDIUM_SIZE,
          color: Constants.SECONDARY_COLOR,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          t.newSpace,
          style: TextStyle(
              fontSize: Constants.S1_FONT_SIZE,
              fontWeight: Constants.MEDIUM_FONT_WEIGHT,
              color: placeholderColor(context)),
        )
      ]),
    );
  }
}
