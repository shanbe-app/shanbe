import 'package:client/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:macos_ui/macos_ui.dart';

class MacosOrDivider extends StatelessWidget {
  final AppLocalizations t;

  const MacosOrDivider({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MacosThemeData macosTheme = MacosTheme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Divider(
          color: dividerColor(context),
          thickness: 1,
          indent: 8,
          endIndent: 8,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Text(
            t.or,
            style: macosTheme.typography.title3,
          ),
        ),
        Expanded(
            child: Divider(
          color: dividerColor(context),
          thickness: 1,
          indent: 8,
          endIndent: 8,
        )),
      ],
    );
  }
}
