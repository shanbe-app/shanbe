import 'package:client/components/atoms/signup_button.dart';
import 'package:client/components/atoms/profile_button.dart';
import 'package:client/rx/blocs/auth_bloc.dart';
import 'package:client/types/enums.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  final BuildContext context;

  const SettingsPage({Key? key, required this.context}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final AuthBloc authBloc;
  late final AppLocalizations t;

  @override
  void initState() {
    super.initState();
    authBloc = AuthBloc();
    t = AppLocalizations.of(widget.context)!;
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Padding(
          padding: Constants.PAGE_PADDING,
          child: CustomScrollView(
            slivers: [
              PlatformWidget(
                material: (_, __) => SliverAppBar(
                  title: PlatformText(t.settings),
                  stretch: true,
                ),
                cupertino: (_, __) => CupertinoSliverNavigationBar(
                  stretch: false,
                  backgroundColor: Constants.BACKGROUND_COLOR,
                  border: null,
                  largeTitle: PlatformText(t.settings),
                ),
              ),
              SliverToBoxAdapter(
                child: StreamBuilder(
                  builder: (context, snapshot) {
                    UserAuthState? state = snapshot.data as UserAuthState?;
                    if (state == UserAuthState.authenticated) {
                      return ProfileButton(
                        authBloc,
                        t,
                        previousPageTitle: t.settings,
                      );
                    } else {
                      return SignupButton(
                        t: t,
                        previousPageTitle: t.settings,
                      );
                    }
                  },
                  stream: authBloc.authState,
                ),
              )
            ],
          )),
    );
  }
}
