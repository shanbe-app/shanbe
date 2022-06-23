import 'package:client/types/signup_intro_data.dart';
import 'package:client/utils/colors.dart';
import 'package:client/types/app_intro_data.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class SignupIntro extends StatefulWidget {
  final List<SignupData> signupData;

  const SignupIntro({
    Key? key,
    required this.signupData,
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
        SizedBox(height: 24,),
        SizedBox(
          height: 256,
          child: PageView(
            controller: _controller,
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
          height: 16,
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: widget.signupData.length,
          textDirection: isRtl(context) ? TextDirection.rtl : TextDirection.ltr,
          effect: SlideEffect(
            dotHeight: 8,
            dotWidth: 8,
            dotColor: dividerColor(context),
            activeDotColor: Constants.SECONDARY_COLOR
          ),
        )
      ],
    );
  }
}
