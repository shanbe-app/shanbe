import 'dart:async';
import 'dart:io';

import 'package:client/rx/blocs/settings_bloc.dart';
import 'package:client/rx/service_provider.dart';
import 'package:client/types/app_intro_data.dart';
import 'package:client/types/signup_page_arugments.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardPage extends StatefulWidget {
  final BuildContext context;

  const OnBoardPage({Key? key, required this.context}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  late PageController _controller;
  late List<AppIntroData> appIntroData;
  late SettingsBloc settingsBloc;
  Timer? _timer;
  late AppLocalizations t;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    t = AppLocalizations.of(widget.context)!;
    settingsBloc = SettingsBloc(ServiceProvider.getInstance().storageService);
    appIntroData = [
      AppIntroData(t.appIntroTitle1, 'assets/files/meditate3.json',
          t.appIntroDescription1),
      AppIntroData(
        t.appIntroTitle2,
        'assets/files/yoga2.json',
        t.appIntroDescription2,
      ),
      AppIntroData(t.appIntroTitle3, 'assets/files/calendar2.json',
          t.appIntroDescription3,
          reverse: true),
      AppIntroData(
          t.appIntroTitle4, 'assets/files/fly.json', t.appIntroDescription4),
    ];
  }

  void setupTimer() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (_controller.page == null) return;
      if (_controller.page!.toInt() + 1 == appIntroData.length) {
        _controller.animateToPage(0,
            duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      } else {
        _controller.animateToPage(_controller.page!.toInt() + 1,
            duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size windowSize = MediaQuery.of(context).size;

    if (isMacos()) {
      return MacosWindow(
        titleBar: TitleBar(
          title: Text(
            t.welcomeToShanbe,
            style: const TextStyle(
                fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                fontSize: Constants.MACOS_TITLE_BAR_FONT_SIZE),
          ),
          height: Constants.MACOS_TITLE_BAR_HEIGHT,
        ),
        child: MacosScaffold(
          children: [
            ContentArea(
                minWidth: 300,
                builder: (context, controller) => Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: windowSize.width,
                          height: windowSize.height / 2,
                          fit: BoxFit.contain,
                        )
                      ],
                    ))
          ],
        ),
      );
    }
    return PlatformScaffold(
      iosContentPadding: true,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: Constants.PAGE_PADDING,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PlatformTextButton(
                    child: Text(
                      t.skip,
                      style: TextStyle(
                          color: placeholderColor(context),
                          fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                          fontSize: Constants.S1_FONT_SIZE),
                    ),
                    onPressed: () {
                      showPlatformDialog(
                          context: context,
                          builder: (context) => PlatformAlertDialog(
                                title: Text(t.skipSignup),
                                content: Text(t.skipSignupDesc),
                                actions: [
                                  PlatformDialogAction(
                                    child: Text(t.cancel),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  PlatformDialogAction(
                                    child: Text(t.confirm),
                                    onPressed: () {
                                      settingsBloc.onFirstVisit();
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/lists', (route) => false);
                                    },
                                  ),
                                ],
                              ));
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, '/inbox', (route) => false);
                    },
                    padding: EdgeInsets.zero,
                  )
                ],
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 128,
                height: 128,
                fit: BoxFit.contain,
              ),
              Text(
                t.shanbe,
                style: TextStyle(
                    color: headingColor(context),
                    fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                    fontSize: Constants.H2_FONT_SIZE),
              ),
              const SizedBox(
                height: 32,
              ),
              Flexible(
                  flex: 10,
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (page) {
                      _timer?.cancel();
                      setupTimer();
                    },
                    children: appIntroData
                        .map((e) => Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                    child: Lottie.asset(e.lottieDir,
                                        alignment: Alignment.center,
                                        repeat: true,
                                        reverse: e.reverse,
                                        width: double.maxFinite,
                                        fit: BoxFit.contain)),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  e.title,
                                  style: TextStyle(
                                      color: headingColor(context),
                                      fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                                      fontSize: Constants.H5_FONT_SIZE),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  height: 64,
                                  child: Text(e.description,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: secondaryTextColor(context),
                                          height: 1.6,
                                          fontWeight:
                                              Constants.REGULAR_FONT_WEIGHT,
                                          fontSize: Constants.H6_FONT_SIZE)),
                                )
                              ],
                            ))
                        .toList(),
                  )),
              const SizedBox(
                height: 16,
              ),
              Flexible(
                flex: 1,
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: appIntroData.length,
                  textDirection:
                      isRtl(context) ? TextDirection.rtl : TextDirection.ltr,
                  effect: WormEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      dotColor: dividerColor(context),
                      activeDotColor: Constants.SECONDARY_COLOR_LIGHT),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Flexible(
                flex: 2,
                child: PlatformElevatedButton(
                  child: Text(
                    t.letsGo,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                        fontSize: Constants.S1_FONT_SIZE),
                  ),
                  onPressed: () {
                    settingsBloc.onFirstVisit();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/lists', (route) => false);
                    Navigator.pushNamed(context, '/signup',
                        arguments:
                            SignupPageArguments(previousPageTitle: t.lists));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
