import 'package:client/components/organisms/select_page_sheet.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:popover/popover.dart';

class SelectParentPageButton extends StatelessWidget {
  final AppLocalizations t;

  const SelectParentPageButton({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PushButton(
        child: Row(
          children: [
            Text(t.addTo),
            const SizedBox(
              width: 4,
            ),
            const Text('My Pages')
          ],
        ),
        onPressed: () {
          showPopover(
              context: context,
              barrierDismissible: true,
              width: 200,
              height: 200,
              isParentAlive: () => true,
              direction: PopoverDirection.top,
              bodyBuilder: (context) => const SelectPageSheet());
        },
        buttonSize: ButtonSize.large);
  }
}
