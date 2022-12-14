import 'dart:async';
import 'dart:io';

import 'package:client/components/molecules/signup_intro.dart';
import 'package:client/components/organisms/macos_onboard_register_view.dart';
import 'package:client/rx/blocs/auth_bloc.dart';
import 'package:client/rx/service_provider.dart';
import 'package:client/types/enums.dart';
import 'package:client/types/signup_intro_data.dart';
import 'package:client/types/signup_page_arugments.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignupPage extends StatefulWidget {
  final BuildContext context;
  final SignupPageArguments arguments;

  const SignupPage({Key? key, required this.arguments, required this.context})
      : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final AppLocalizations t;
  late final List<SignupIntroData> signupData;
  late final AuthBloc authBloc;
  late final StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    t = AppLocalizations.of(widget.context)!;
    signupData = [
      SignupIntroData(t.appRegisterTitle1, 'assets/files/sync.json',
          reverse: true),
      SignupIntroData(t.appRegisterTitle2, 'assets/files/notification.json'),
      SignupIntroData(t.appRegisterTitle3, 'assets/files/clock.json'),
      SignupIntroData(t.appRegisterTitle4, 'assets/files/folder.json',
          reverse: true),
      SignupIntroData(t.appRegisterTitle5, 'assets/files/images.json')
    ];
    authBloc = AuthBloc(ServiceProvider.getInstance().firebaseService);
    _subscription = authBloc.authState.listen((event) {
      if (event == UserAuthState.authenticated) {
        Navigator.pushNamedAndRemoveUntil(
            widget.context, '/lists', (route) => false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isMacOS) {
      return MacosOnboardRegisterView(t: t, signupData: signupData);
    }
    return PlatformScaffold(
      appBar: PlatformAppBar(
        cupertino: (_, __) => CupertinoNavigationBarData(
          previousPageTitle: widget.arguments.previousPageTitle,
          border: Border.all(width: 0, color: backgroundColor(context)),
          backgroundColor: backgroundColor(context),
          automaticallyImplyMiddle: true,
        ),
        material: (_, __) => MaterialAppBarData(
            elevation: 0, backgroundColor: backgroundColor(context)),
        automaticallyImplyLeading: true,
        title: Text(t.signup),
      ),
      iosContentPadding: true,
      // iosContentBottomPadding: true,
      body: Padding(
        padding: Constants.PAGE_PADDING,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SignupIntro(
              signupData: signupData,
            ),
            const SizedBox(
              height: 32,
            ),
            Center(
              child: SignInButton(
                isDark(context) ? Buttons.GoogleDark : Buttons.Google,
                elevation: 4,
                text: t.continueWithGoogle,
                onPressed: () {
                  authBloc.socialSignIn();
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: SignInButtonBuilder(
                text: t.continueWithEmail,
                icon: Icons.email,
                elevation: 4,
                onPressed: () {},
                backgroundColor: Colors.blueGrey[700]!,
              ),
            ),
            const Spacer(),
            Text(
              t.licenseAgreement,
              style: TextStyle(
                  height: 1.5,
                  color: placeholderColor(context),
                  fontSize: Constants.S2_FONT_SIZE),
            ),
            Row(
              children: [
                PlatformTextButton(
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: secondaryTextColor(context),
                      fontSize: Constants.S2_FONT_SIZE,
                    ),
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                ),
                const SizedBox(
                  width: 8,
                ),
                PlatformTextButton(
                  child: Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      color: secondaryTextColor(context),
                      fontSize: Constants.S2_FONT_SIZE,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              t.copyrightShanbe,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: secondaryTextColor(context),
                  fontSize: Constants.S2_FONT_SIZE),
            ),
            const SizedBox(
              height: 64,
            ),
          ],
        ),
      ),
    );
  }
}
