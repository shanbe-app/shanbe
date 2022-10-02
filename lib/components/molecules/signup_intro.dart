import 'dart:async';

import 'package:client/types/signup_intro_data.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class SignupIntro extends StatefulWidget {
  final List<SignupIntroData> signupData;

  const SignupIntro({
    Key? key,
    required this.signupData,
  }) : super(key: key);

  @override
  State<SignupIntro> createState() => _SignupIntroState();
}

class _SignupIntroState extends State<SignupIntro> {
  late PageController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_controller.page == null) return;
      _controller.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      if (_controller.page!.toInt() + 1 == widget.signupData.length) {
        _controller.animateToPage(0,
            duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      } else {
        _controller.animateToPage(_controller.page!.toInt() + 1,
            duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      }
    });
  }

  void setupTimer() {
    _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
      if (_controller.page == null) return;
      if (_controller.page!.toInt() + 1 == widget.signupData.length) {
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
    _controller.dispose;
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 272,
          child: PageView(
            controller: _controller,
            onPageChanged: (page) {
              _timer?.cancel();
              setupTimer();
            },
            children: widget.signupData
                .map((e) => Column(
                      children: [
                        Lottie.asset(e.lottieDir,
                            alignment: Alignment.center,
                            repeat: true,
                            reverse: e.reverse,
                            width: double.maxFinite,
                            height: 220,
                            fit: BoxFit.contain),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          e.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: headingColor(context),
                              fontSize: Constants.S1_FONT_SIZE),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: widget.signupData.length,
          textDirection: isRtl(context) ? TextDirection.rtl : TextDirection.ltr,
          effect: SlideEffect(
              dotHeight: 8,
              dotWidth: 8,
              dotColor: dividerColor(context),
              activeDotColor: Constants.SECONDARY_COLOR_LIGHT),
        )
      ],
    );
  }
}
