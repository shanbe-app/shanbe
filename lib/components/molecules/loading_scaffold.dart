import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoadingScaffold extends StatelessWidget {
  final AppLocalizations t;

  const LoadingScaffold({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size windowSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.contain,
          height: windowSize.height * 3 / 4,
          width: windowSize.width,
          isAntiAlias: true,
        ),
        const Spacer(),
        PlatformCircularProgressIndicator(),
        const SizedBox(
          height: 16,
        ),
        Text(
          t.copyrightShanbe,
          style: TextStyle(
              fontSize: Constants.S2_FONT_SIZE,
              color: secondaryTextColor(context),
              fontWeight: Constants.REGULAR_FONT_WEIGHT),
        ),
        const SizedBox(
          height: 32,
        )
      ],
    );
  }
}
