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
  final BuildContext context;

  const IntroPage({Key? key, required this.context}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _controller;
  late List<AppIntroData> appIntroData;
  late AppLocalizations t;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    t = AppLocalizations.of(widget.context);
    appIntroData = [
      AppIntroData(t.appIntroTitle1, 'assets/files/meditate3.json',
          t.appIntroDescription1),
      AppIntroData(
          t.appIntroTitle2, 'assets/files/yoga2.json', t.appIntroDescription2),
      AppIntroData(t.appIntroTitle3, 'assets/files/calendar.json',
          t.appIntroDescription3),
      AppIntroData(
          t.appIntroTitle4, 'assets/files/book.json', t.appIntroDescription4),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      iosContentPadding: true,
      body: Padding(
        padding: Constants.PAGE_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                  child: Lottie.asset(e.lottieDir,
                                      alignment: Alignment.center,
                                      repeat: true,
                                      reverse: false,
                                      width: double.maxFinite,
                                      fit: BoxFit.contain)),
                              const SizedBox(
                                height: 24,
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
                                      fontWeight: Constants.REGULAR_FONT_WEIGHT,
                                      fontSize: Constants.S2_FONT_SIZE))
                            ],
                          ))
                      .toList(),
                )),
            const SizedBox(
              height: 32,
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: appIntroData.length,
                    textDirection:
                        isRtl(context) ? TextDirection.rtl : TextDirection.ltr,
                    effect: WormEffect(
                        dotWidth: 12,
                        dotHeight: 12,
                        dotColor: placeholderColor(context),
                        activeDotColor: Constants.PRIMARY_COLOR),
                  ),
                  Spacer(),
                  PlatformElevatedButton(
                    child: Text('Let\'s go'),
                    onPressed: (){},
                  )
                ],
              ),
            ),
            SizedBox(height: 32,)
          ],
        ),
      ),
    );
  }
}
