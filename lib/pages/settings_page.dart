import 'package:client/rx/services/app_service.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late AppService appService;
  AppLocalizations? t;

  @override
  void initState() {
    super.initState();
    appService = GetIt.I.get<AppService>(instanceName: 'appService');
  }

  @override
  Widget build(BuildContext context) {
    t ??= AppLocalizations.of(context);

    return CustomScrollView(
      slivers: [
        PlatformWidget(
          material: (_, __) => SliverAppBar(),
          cupertino: (_, __) => CupertinoSliverNavigationBar(
            stretch: false,
            backgroundColor: Constants.BACKGROUND_COLOR,
            border: null,
            largeTitle: PlatformText(t!.settings),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: Constants.PAGE_PADDING,
            child: Column(
              children: [
                PlatformWidget(
                  material: (_, __) => Card(
                      shape: Constants.CARD_SHAPE,
                      child: Padding(
                        padding: Constants.CARD_INNER_PADDING,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.account_circle,
                              color: Constants.LINE_COLOR_DARK,
                              size: 64,
                            ),
                            const SizedBox(width: 4,),
                            Column(
                              children: [
                                Text(
                                  t!.loginOrRegister,
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                  cupertino: (_, __) => CupertinoButton(
                    color: Colors.white,
                    padding: EdgeInsets.zero,
                    child: Padding(
                      padding: Constants.CARD_INNER_PADDING,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.account_circle,
                            color: Constants.PLACEHOLDER_COLOR,
                            size: 64,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                t!.loginOrRegister,
                                style: TextStyle(
                                    fontSize: Constants.S1_FONT_SIZE,
                                    color: Constants.PRIMARY_COLOR,
                                    fontWeight: Constants.MEDIUM_FONT_WEIGHT),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                t!.loginOrRegisterDesc,
                                style: const TextStyle(
                                    fontSize: Constants.CAPTION_FONT_SIZE,
                                    fontWeight: Constants.REGULAR_FONT_WEIGHT,
                                    color: Constants.PLACEHOLDER_COLOR),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
