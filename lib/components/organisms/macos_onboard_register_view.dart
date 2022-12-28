import 'package:client/components/atoms/macos_social_login_button.dart';
import 'package:client/components/organisms/macos_onboard_values_view.dart';
import 'package:client/rx/blocs/onboard_bloc.dart';
import 'package:client/rx/service_provider.dart';
import 'package:client/types/signup_intro_data.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MacosOnboardRegisterView extends StatefulWidget {
  final AppLocalizations t;
  final List<SignupIntroData> signupData;

  const MacosOnboardRegisterView(
      {Key? key, required this.t, required this.signupData})
      : super(key: key);

  @override
  State<MacosOnboardRegisterView> createState() =>
      _MacosOnboardRegisterViewState();
}

class _MacosOnboardRegisterViewState extends State<MacosOnboardRegisterView> {
  late OnboardBloc onboardBloc;
  bool shareAnonymousData = true;

  @override
  initState() {
    super.initState();
    onboardBloc = OnboardBloc(ServiceProvider.getInstance().firebaseService);
  }

  void nextPage() {
    Navigator.of(context).push(CupertinoPageRoute(
        builder: (_) => MacosOnboardValuesView(t: widget.t)));
  }

  @override
  Widget build(BuildContext context) {
    var t = widget.t;
    Size windowSize = MediaQuery.of(context).size;
    MacosThemeData macosTheme = MacosTheme.of(context);
    return MacosWindow(
      child: MacosScaffold(
        toolBar: ToolBar(
            title: Text(
              t.signup,
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            height: Constants.MACOS_TITLE_BAR_HEIGHT,
            leading: Padding(
              padding: const EdgeInsets.only(left: 80),
              child: MacosBackButton(
                fillColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )),
        children: [
          ContentArea(
              minWidth: 400,
              builder: (context, controller) => SingleChildScrollView(
                    padding: Constants.PAGE_PADDING,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        // SignupIntro(
                        //   signupData: widget.signupData,
                        // ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              height: windowSize.height / 8,
                              width: windowSize.width / 8,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  t.welcomeToShanbe,
                                  style: macosTheme.typography.title1,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  t.loginToSyncYourContent,
                                  style: macosTheme.typography.title3,
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          width: 245,
                          alignment: Alignment.center,
                          child: MacosSocialLoginButton(
                              buttonType: Buttons.Google,
                              text: t.continueWithGoogle),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: 245,
                          alignment: Alignment.center,
                          child: MacosSocialLoginButton(
                              buttonType: Buttons.Apple,
                              text: t.continueWithGoogle),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          widget.t.welcomeToShanbe,
                          style: MacosTheme.of(context).typography.title1,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          t.welcomeIntro,
                          textAlign: TextAlign.center,
                          style: MacosTheme.of(context).typography.body,
                        ),
                        SizedBox(
                          height: windowSize.height / 6,
                        ),
                        Text(
                          t.privacyPolicyAgreementPrompt,
                          style: MacosTheme.of(context).typography.caption1,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        PushButton(
                          child: const Text(Constants.PRIVACY_POLICY_URL),
                          color: macosTheme.pushButtonTheme.secondaryColor,
                          buttonSize: ButtonSize.small,
                          onPressed: () async {
                            await launchUrlString(Constants.PRIVACY_POLICY_URL,
                                mode: LaunchMode.platformDefault);
                          },
                        ),
                        SizedBox(
                          height: windowSize.height / 16,
                        ),
                      ],
                    ),
                  ))
        ],
      ),
    );
  }
}
