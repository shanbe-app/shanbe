import 'dart:async';

import 'package:client/types/inbox_page_arguments.dart';
import 'package:client/utils/colors.dart';
import 'package:client/types/app_intro_data.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroPage extends StatefulWidget {
  final BuildContext context;

  const IntroPage({Key? key, required this.context}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _controller;
  late List<AppIntroData> appIntroData;
  late Timer _timer;
  late AppLocalizations t;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    t = AppLocalizations.of(widget.context)!;
    appIntroData = [
      AppIntroData(t.appIntroTitle1, 'assets/files/meditate3.json',
          t.appIntroDescription1),
      AppIntroData(
          t.appIntroTitle2, 'assets/files/yoga2.json', t.appIntroDescription2),
      AppIntroData(t.appIntroTitle3, 'assets/files/calendar2.json',
          t.appIntroDescription3,
          reverse: true),
      AppIntroData(
          t.appIntroTitle4, 'assets/files/fly.json', t.appIntroDescription4),
    ];
    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
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
    _timer.cancel();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      iosContentPadding: true,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: Constants.PAGE_PADDING,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PlatformTextButton(
                    child: Text(
                      t.skip,
                      style: TextStyle(color: placeholderColor(context)),
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
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/inbox', (route) => false);
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
                'assets/images/logo_android.png',
                width: 128,
                fit: BoxFit.contain,
              ),
              Text(
                t.shanbe,
                style: TextStyle(
                    color: headingColor(context),
                    fontWeight: Constants.DEMI_BOLD_FONT_WEIGHT,
                    fontSize: Constants.H3_FONT_SIZE),
              ),
              const SizedBox(
                height: 32,
              ),
              Flexible(
                  flex: 10,
                  child: PageView(
                    controller: _controller,
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
                                      fontSize: Constants.H6_FONT_SIZE),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(e.description,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: secondaryTextColor(context),
                                        fontWeight:
                                            Constants.REGULAR_FONT_WEIGHT,
                                        fontSize: Constants.S2_FONT_SIZE))
                              ],
                            ))
                        .toList(),
                  )),
              const SizedBox(
                height: 24,
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
                      dotColor: placeholderColor(context),
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
                        fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                        fontSize: Constants.S1_FONT_SIZE),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/inbox', (route) => false,
                        arguments: InboxPageArguments(initialPage: 'settings'));
                    Navigator.pushNamed(context, '/signup');
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
