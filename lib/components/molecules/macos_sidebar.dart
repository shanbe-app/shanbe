import 'package:client/components/organisms/new_page_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

var macosSidebar = (AppLocalizations t, BuildContext context) => Sidebar(
    minWidth: 140,
    bottom: MacosListTile(
      leading: const MacosIcon(
        CupertinoIcons.add,
      ),
      title: Text(t.newPage),
      mouseCursor: SystemMouseCursors.click,
      onClick: () {
        showMacosSheet(
            context: context,
            builder: (_) => NewPageSheet(
                  t: t,
                ),
            barrierDismissible: true);
      },
    ),
    builder: (context, controller) => const Text('test'));
