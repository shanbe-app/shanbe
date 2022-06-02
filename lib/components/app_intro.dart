import 'package:client/pages/colors.dart';
import 'package:client/types/app_intro_Data.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class AppIntro extends StatefulWidget {
  final List<AppIntroData> appIntroData;

  const AppIntro({Key? key,
    required this.appIntroData,})
      : super(key: key);

  @override
  State<AppIntro> createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {
  late PageController _controller;

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
    return Column(
      children: [
        PageView(
          controller: _controller,
          children: widget.appIntroData.map((e) =>
              Column(
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
                  Text(e.title, style: TextStyle(
                      color: headingColor(context),
                      fontSize: Constants.S1_FONT_SIZE),),
                  const SizedBox(height: 16,),
                  Text(e.description, style: TextStyle(
                      color: secondaryTextColor(context),
                      fontSize: Constants.S2_FONT_SIZE))
                ],
              )
          ).toList(),
        ),
        const SizedBox(height: 16,),
        SmoothPageIndicator(
          controller: _controller,
          count: widget.appIntroData.length,
          textDirection: isRtl(context) ? TextDirection.rtl : TextDirection.ltr,
          effect: ExpandingDotsEffect(
              dotWidth: 12,
              dotHeight: 12,
              activeDotColor: Constants.PRIMARY_COLOR),
        )
      ],
    );
  }
}
