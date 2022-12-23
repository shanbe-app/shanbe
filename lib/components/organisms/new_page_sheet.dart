import 'package:client/components/organisms/select_parent_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:macos_ui/macos_ui.dart';

class NewPageSheet extends StatelessWidget {
  final AppLocalizations t;

  const NewPageSheet({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosSheet(
        child: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  MacosIconButton(
                    icon: const MacosIcon(CupertinoIcons.fullscreen),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  MacosPulldownButton(
                    icon: CupertinoIcons.square_righthalf_fill,
                    items: [
                      MacosPulldownMenuItem(
                        title: Row(
                          children: [
                            const MacosIcon(
                                CupertinoIcons.square_righthalf_fill),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(t.rightPane)
                          ],
                        ),
                      ),
                      MacosPulldownMenuItem(
                        title: Row(
                          children: [
                            const MacosIcon(CupertinoIcons.square),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(t.centerSheet)
                          ],
                        ),
                      ),
                      MacosPulldownMenuItem(
                        title: Row(
                          children: [
                            const MacosIcon(CupertinoIcons.square_fill),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(t.fullScreen)
                          ],
                        ),
                      )
                    ],
                  ),
                  const Divider(),
                  SelectParentPageButton(t: t)
                ],
              ),
            ),
            const Spacer(),
            Row()
          ],
        )
      ],
    ));
  }
}
