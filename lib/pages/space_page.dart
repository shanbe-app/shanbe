import 'package:client/components/atoms/bottom_sheet_scroll_indicator.dart';
import 'package:client/components/atoms/new_space_item.dart';
import 'package:client/components/atoms/space_item.dart';
import 'package:client/components/molecules/space_dialog.dart';
import 'package:client/components/organisms/space_list.dart';
import 'package:client/models/Space.dart';
import 'package:client/rx/blocs/space_bloc.dart';
import 'package:client/types/space_page_arguments.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SpacePage extends StatefulWidget {
  final SpacePageArguments arguments;
  final BuildContext context;

  const SpacePage({Key? key, required this.arguments, required this.context})
      : super(key: key);

  @override
  _SpacePageState createState() => _SpacePageState();
}

class _SpacePageState extends State<SpacePage> {
  late AppLocalizations t;
  late SpaceBloc spaceBloc;

  @override
  void initState() {
    super.initState();
    spaceBloc = SpaceBloc();
    t = AppLocalizations.of(widget.context)!;
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (context, platform) => Scaffold(
        body: renderTabBody(context),
      ),
      cupertino: (context, platform) => CupertinoPageScaffold(
        key: widget.key ?? GlobalKey(debugLabel: 'lists'),
        child: renderTabBody(context),
      ),
    );
  }

  Widget renderTabBody(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      child: Column(
        children: [
          PlatformAppBar(
            title: PlatformTextButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showPlatformContentSheet(
                    context: context,
                    builder: (context) {
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
                                  if (space.id != widget.arguments.space.id) {
                                    Navigator.of(context).pushNamed('/space',
                                        arguments:
                                            SpacePageArguments(space: space));
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
                                      builder: (context) => SpaceDialog(t,
                                              onCreate: (Space space) {
                                            spaceBloc.createSpace(
                                                newSpace: space);
                                          }, onUpdate: (Space space) {}));
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(children: [
                    SpaceItem(
                      space: widget.arguments.space,
                      spaceNameColor: headingColor(context),
                    )
                  ]),
                  const SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: grayColor(context),
                  )
                ],
              ),
            ),
            cupertino: (context, _) => CupertinoNavigationBarData(
              previousPageTitle: t.spaces,
            ),
          )
        ],
      ),
    );
  }
}
