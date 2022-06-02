import 'package:client/components/login_button.dart';
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
              children: const [
                LoginButton()
              ],
            ),
          ),
        )
      ],
    );
  }
}
