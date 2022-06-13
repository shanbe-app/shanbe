import 'package:client/utils/colors.dart';
import 'package:client/types/app_intro_Data.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _controller;
  late List<AppIntroData> appIntroData;
  AppLocalizations? t;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    t ??= AppLocalizations.of(context);

    return PlatformScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo/logo.png',
                  width: 120,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Shanbe',
                  style: TextStyle(
                      color: headingColor(context),
                      fontSize: Constants.S2_FONT_SIZE),
                )
              ],
            ),
            PageView(
              controller: _controller,
              children: [
                AppIntroData(
                    t!.appIntroTitle1,
                    'assets/images/files/man_meditate.json',
                    t!.appIntroDescription1),
                AppIntroData(
                    t!.appIntroTitle2,
                    'assets/images/files/meditate.json',
                    t!.appIntroDescription2),
                AppIntroData(t!.appIntroTitle3, 'assets/images/files/yoga.json',
                    t!.appIntroDescription3),
                AppIntroData(t!.appIntroTitle4,
                    'assets/images/files/breath.json', t!.appIntroDescription4),
              ]
                  .map((e) => Column(
                        children: [
                          Lottie.asset(e.lottieDir,
                              alignment: Alignment.center,
                              height: null,
                              repeat: true,
                              reverse: false,
                              width: 350,
                              fit: BoxFit.cover),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            e.title,
                            style: TextStyle(
                                color: headingColor(context),
                                fontSize: Constants.S1_FONT_SIZE),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(e.description,
                              style: TextStyle(
                                  color: secondaryTextColor(context),
                                  fontSize: Constants.S2_FONT_SIZE))
                        ],
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 16,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: appIntroData.length,
              textDirection:
                  isRtl(context) ? TextDirection.rtl : TextDirection.ltr,
              effect: ExpandingDotsEffect(
                  dotWidth: 12,
                  dotHeight: 12,
                  activeDotColor: Constants.PRIMARY_COLOR),
            )
          ],
        ),
      ),
    );
  }
}
