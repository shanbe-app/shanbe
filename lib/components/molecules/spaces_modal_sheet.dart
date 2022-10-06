import 'package:client/components/atoms/bottom_sheet_scroll_indicator.dart';
import 'package:client/components/atoms/new_space_item.dart';
import 'package:client/components/molecules/space_dialog.dart';
import 'package:client/components/organisms/space_list.dart';
import 'package:client/models/Space.dart';
import 'package:client/types/space_page_arguments.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SpacesModalSheet extends StatelessWidget {
  final Function(Space) onCreateSpace;
  final Space currentSpace;
  final AppLocalizations t;

  const SpacesModalSheet(
      {Key? key,
      required this.currentSpace,
      required this.t,
      required this.onCreateSpace})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 32, top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const BottomSheetScrollIndicator(),
            Center(
              child: Text(
                t.yourSpaces,
                style: TextStyle(
                    fontSize: Constants.H6_FONT_SIZE,
                    color: headingColor(context),
                    fontWeight: Constants.MEDIUM_FONT_WEIGHT),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SpaceList(
              t: t,
              onPress: (space) {
                if (space.id != currentSpace.id) {
                  Navigator.of(context).pushNamed('/space',
                      arguments: SpacePageArguments(space: space));
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            NewSpaceItem(
              t: t,
              onPress: () {
                showPlatformDialog(
                    context: context,
                    builder: (context) =>
                        SpaceDialog(t, onCreate: onCreateSpace));
              },
            )
          ],
        ),
      ),
    );
  }
}
