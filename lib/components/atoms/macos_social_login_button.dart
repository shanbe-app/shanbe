import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:macos_ui/macos_ui.dart';

class MacosSocialLoginButton extends StatelessWidget {
  final String text;
  final Buttons buttonType;

  const MacosSocialLoginButton(
      {Key? key, required this.text, required this.buttonType})
      : super(key: key);

  Widget renderIcon(BuildContext context) {
    switch (buttonType) {
      case Buttons.Google:
        return Image.asset(
          'assets/images/google_light.png',
          width: Constants.ICON_X_LARGE_SIZE,
        );
      default:
        return const Icon(
          Icons.apple,
          color: Colors.black,
          size: Constants.ICON_LARGE_SIZE,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PushButton(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      onPressed: () {},
      color: Colors.white,
      buttonSize: ButtonSize.large,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Constants.ICON_X_LARGE_SIZE,
              height: Constants.ICON_X_LARGE_SIZE,
              child: renderIcon(context),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: Constants.S1_FONT_SIZE,
                  fontWeight: Constants.MEDIUM_FONT_WEIGHT),
            )
          ],
        ),
      ),
    );
  }
}
