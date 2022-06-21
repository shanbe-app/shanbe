import 'package:client/components/login_button.dart';
import 'package:client/rx/services/app_service.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class SettingsPage extends StatefulWidget {
  final AppLocalizations t;

  const SettingsPage(this.t, {Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late AppService appService;

  @override
  void initState() {
    super.initState();
    appService = GetIt.I.get<AppService>(instanceName: 'appService');
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        PlatformWidget(
          material: (_, __) => const SliverAppBar(),
          cupertino: (_, __) => CupertinoSliverNavigationBar(
            stretch: false,
            backgroundColor: Constants.BACKGROUND_COLOR,
            border: null,
            largeTitle: PlatformText(widget.t.settings),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: Constants.PAGE_PADDING,
            child: Column(
              children: const [LoginButton()],
            ),
          ),
        )
      ],
    );
  }
}
