import 'package:client/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:macos_ui/macos_ui.dart';

class MacosOnboardValueTile extends StatelessWidget {
  final String lottiePath;
  final String title;
  final String subtitle;
  final int fraction;

  const MacosOnboardValueTile(
      {Key? key,
      required this.fraction,
      required this.lottiePath,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(lottiePath,
            width: size.width / 4,
            height: size.height / 4,
            repeat: true,
            fit: BoxFit.contain),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              softWrap: true,
              style: MacosTheme.of(context).typography.title2,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              subtitle,
              softWrap: true,
              style: MacosTheme.of(context).typography.body.copyWith(
                    color: secondaryTextColor(context),
                    height: 1.6,
                  ),
            )
          ],
        ))
      ],
    );
  }
}
