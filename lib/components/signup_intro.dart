import 'package:client/utils/colors.dart';
import 'package:client/types/app_intro_data.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class SignupIntro extends StatefulWidget {
  final List<AppIntroData> appIntroData;

  const SignupIntro({
    Key? key,
    required this.appIntroData,
  }) : super(key: key);

  @override
  State<SignupIntro> createState() => _SignupIntroState();
}

class _SignupIntroState extends State<SignupIntro> {
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
        Container(
          height: 220,
          child: PageView(
            controller: _controller,
            children: widget.appIntroData
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
        ),
        const SizedBox(
          height: 16,
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: widget.appIntroData.length,
          textDirection: isRtl(context) ? TextDirection.rtl : TextDirection.ltr,
          effect: ColorTransitionEffect(
          ),
        )
      ],
    );
  }
}
