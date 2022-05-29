import 'package:client/pages/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class AppIntro extends StatefulWidget {
  const AppIntro({Key? key}) : super(key: key);

  @override
  State<AppIntro> createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {
  late PageController _controller;
  AppLocalizations? _t;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _t ??= AppLocalizations.of(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: PageView(
              controller: _controller,
              allowImplicitScrolling: true,
              children: [
                SingleChildScrollView(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Lottie.asset('assets/files/tasks.json',
                        alignment: Alignment.center,
                        height: 250,
                        repeat: true,
                        reverse: true,
                        fit: BoxFit.cover),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      _t!.welcomeToShanbe,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Constants.H5_FONT_SIZE,
                          fontWeight: Constants.BOLD_FONT_WEIGHT,
                          color: textColor(context)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      _t!.welcomeToShanbeDesc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Constants.S2_FONT_SIZE,
                          fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                          color: textColor(context)),
                    )
                  ],
                )),
                SingleChildScrollView(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Lottie.asset('assets/files/idea.json',
                        alignment: Alignment.center,
                        height: 250,
                        repeat: true,
                        reverse: true,
                        fit: BoxFit.cover),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      _t!.toGenerateIdeasNotHavingThem,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Constants.H5_FONT_SIZE,
                          fontWeight: Constants.BOLD_FONT_WEIGHT,
                          color: textColor(context)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      _t!.toGenerateIdeasNotHavingThemDesc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Constants.S2_FONT_SIZE,
                          fontWeight: Constants.REGULAR_FONT_WEIGHT,
                          color: textColor(context)),
                    )
                  ],
                )),
                SingleChildScrollView(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Lottie.asset('assets/files/boy.json',
                        alignment: Alignment.center,
                        height: 250,
                        repeat: true,
                        reverse: false,
                        fit: BoxFit.cover),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      _t!.projectsToOrganize,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Constants.H5_FONT_SIZE,
                          fontWeight: Constants.BOLD_FONT_WEIGHT,
                          color: textColor(context)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      _t!.projectsToOrganizeDesc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Constants.S2_FONT_SIZE,
                          fontWeight: Constants.REGULAR_FONT_WEIGHT,
                          color: textColor(context)),
                    )
                  ],
                ))
              ],
            )),
        Padding(
          padding: EdgeInsets.only(bottom: 32, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                    dotWidth: 12,
                    dotHeight: 12,
                    activeDotColor: Constants.PRIMARY_COLOR),
              ),
            ],
          ),
        )
      ],
    );
  }
}
