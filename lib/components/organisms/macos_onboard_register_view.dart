import 'package:client/components/atoms/macos_or_divider.dart';
import 'package:client/components/atoms/macos_social_login_button.dart';
import 'package:client/components/organisms/macos_onboard_values_view.dart';
import 'package:client/rx/blocs/onboard_bloc.dart';
import 'package:client/rx/service_provider.dart';
import 'package:client/types/signup_intro_data.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:macos_ui/macos_ui.dart';

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
  final _formKey = GlobalKey<FormState>();
  final double pageWidth = 245;

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
              builder: (context, controller) => Column(
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                        padding: Constants.PAGE_PADDING,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/logo.png',
                                  height: windowSize.height / 8,
                                  width: windowSize.width / 8,
                                  fit: BoxFit.contain,
                                  isAntiAlias: true,
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
                              width: pageWidth,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  MacosSocialLoginButton(
                                      buttonType: Buttons.Google,
                                      text: t.continueWithGoogle),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  MacosOrDivider(t: t),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            t.email,
                                            style: macosTheme.typography.body,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      MacosTextField(
                                        placeholder: t.enterYourEmail,
                                        maxLines: 1,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.done,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            child: PushButton(
                                                child:
                                                    Text(t.continueWithEmail),
                                                onPressed: () {},
                                                isSecondary: true,
                                                buttonSize: ButtonSize.large),
                                          ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 32,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: PushButton(
                                            buttonSize: ButtonSize.small,
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 2),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: macosTheme
                                                              .typography
                                                              .body
                                                              .color!))),
                                              child: Text(
                                                t.forgotPassword,
                                                style:
                                                    macosTheme.typography.body,
                                              ),
                                            ),
                                            isSecondary: true,
                                            mouseCursor:
                                                MouseCursor.uncontrolled,
                                            alignment: Alignment.center,
                                            color: Colors.transparent,
                                            onPressed: () {},
                                          ))
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                      Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            constraints: BoxConstraints(
                                minWidth: pageWidth, maxWidth: 700),
                            width: windowSize.width / 2,
                            child: Text(
                              t.licenseAgreement,
                              textAlign: TextAlign.center,
                              style: macosTheme.typography.body
                                  .copyWith(color: secondaryTextColor(context)),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  PushButton(
                                    child: Text(t.privacyPolicy),
                                    buttonSize: ButtonSize.small,
                                    isSecondary: true,
                                    onPressed: () {},
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  PushButton(
                                    child: Text(t.privacyPolicy),
                                    buttonSize: ButtonSize.small,
                                    isSecondary: true,
                                    onPressed: () {},
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    t.copyrightShanbe,
                                    textAlign: TextAlign.center,
                                    style: macosTheme.typography.body.copyWith(
                                        color: secondaryTextColor(context)),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          )
                        ],
                      )
                    ],
                  ))
        ],
      ),
    );
  }
}
