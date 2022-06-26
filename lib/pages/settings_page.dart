import 'package:client/components/login_button.dart';
import 'package:client/components/profile_button.dart';
import 'package:client/rx/blocs/auth_bloc.dart';
import 'package:client/rx/services/app_service.dart';
import 'package:client/types/enums.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  final AppLocalizations t;

  const SettingsPage(this.t, {Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final AuthBloc authBloc;

  @override
  void initState() {
    super.initState();
    authBloc = AuthBloc(AppService.getInstance());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: Constants.PAGE_PADDING,
        child: CustomScrollView(
          slivers: [
            PlatformWidget(
              material: (_, __) => SliverAppBar(
                title: PlatformText(widget.t.settings),
                stretch: true,
              ),
              cupertino: (_, __) => CupertinoSliverNavigationBar(
                stretch: false,
                backgroundColor: Constants.BACKGROUND_COLOR,
                border: null,
                largeTitle: PlatformText(widget.t.settings),
              ),
            ),
            SliverToBoxAdapter(
              child: StreamBuilder(
                builder: (context, snapshot) {
                  AuthState? state = snapshot.data as AuthState?;
                  if (state == AuthState.authenticated) {
                    return ProfileButton(authBloc, widget.t);
                  } else {
                    return const SignupButton();
                  }
                },
                stream: authBloc.authState,
              ),
            )
          ],
        ));
  }
}
