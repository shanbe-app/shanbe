import 'package:client/rx/blocs/onboard_bloc.dart';
import 'package:client/rx/service_provider.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MacosOnboardView extends StatefulWidget {
  final AppLocalizations t;

  const MacosOnboardView({Key? key, required this.t}) : super(key: key);

  @override
  State<MacosOnboardView> createState() => _MacosOnboardViewState();
}

class _MacosOnboardViewState extends State<MacosOnboardView> {
  static const totalPages = 3;
  late OnboardBloc onboardBloc;
  int currentPage = 0;
  bool shareAnonymousData = true;

  @override
  initState() {
    super.initState();
    onboardBloc = OnboardBloc(ServiceProvider.getInstance().firebaseService);
  }

  void nextPage() {
    if (currentPage < totalPages - 1) {
      setState(() {
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var t = widget.t;
    Size windowSize = MediaQuery.of(context).size;
    MacosThemeData macosTheme = MacosTheme.of(context);
    // late ModelBloc<WorkSpace> workspaceBloc;

    return ScrollConfiguration(
        behavior: const MacosScrollBehavior(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: SingleChildScrollView(
              padding: Constants.PAGE_PADDING,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: windowSize.width / 3,
                    height: windowSize.height / 3,
                    fit: BoxFit.contain,
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
            )),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      shareAnonymousData = !shareAnonymousData;
                    });
                  },
                  child: Row(
                    children: [
                      MacosCheckbox(
                          value: shareAnonymousData,
                          onChanged: (share) {
                            setState(() {
                              shareAnonymousData = share;
                            });
                          }),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        t.shareAnonymousData,
                        style: macosTheme.typography.caption1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: windowSize.height / 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    PushButton(
                        child: Text(
                          t.skip,
                        ),
                        color: macosTheme.pushButtonTheme.secondaryColor,
                        onPressed: () {
                          onboardBloc.setupAnonymous(
                              shareAnonymousData, t.defaultWorkspaceName,
                              onError: () {
                            //  TODO: show error
                          });
                        },
                        buttonSize: ButtonSize.small),
                    const SizedBox(
                      width: 16,
                    ),
                    PushButton(
                      child: Text(
                        t.next,
                      ),
                      buttonSize: ButtonSize.small,
                      onPressed: () {
                        nextPage();
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                )
              ],
            )
          ],
        ));
  }
}
