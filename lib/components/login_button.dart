import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupButton extends StatefulWidget {
  const SignupButton({Key? key}) : super(key: key);

  @override
  State<SignupButton> createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  AppLocalizations? t;

  @override
  Widget build(BuildContext context) {
    t ??= AppLocalizations.of(context);
    return PlatformWidgetBuilder(
      material: (_, child, __) =>
          Card(shape: Constants.CARD_SHAPE, child: child),
      cupertino: (_, child, __) => CupertinoButton(
        color: Colors.white,
        padding: EdgeInsets.zero,
        child: child ?? Container(),
        onPressed: () {
          Navigator.pushNamed(context, '/signup');
        },
      ),
      child: Padding(
        padding: Constants.CARD_INNER_PADDING,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              color: Constants.PLACEHOLDER_COLOR,
              size: 64,
            ),
            const SizedBox(
              width: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t!.loginOrRegister,
                  style: TextStyle(
                      fontSize: Constants.S1_FONT_SIZE,
                      color: Constants.PRIMARY_COLOR,
                      fontWeight: Constants.MEDIUM_FONT_WEIGHT),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  t!.loginOrRegisterDesc,
                  style: const TextStyle(
                      fontSize: Constants.CAPTION_FONT_SIZE,
                      fontWeight: Constants.REGULAR_FONT_WEIGHT,
                      color: Constants.PLACEHOLDER_COLOR),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
