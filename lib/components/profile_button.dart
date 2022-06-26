import 'package:client/components/login_button.dart';
import 'package:client/components/profile_avatar.dart';
import 'package:client/rx/blocs/auth_bloc.dart';
import 'package:client/types/user.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileButton extends StatefulWidget {
  final AppLocalizations t;
  final AuthBloc authBloc;

  const ProfileButton(this.authBloc, this.t, {Key? key}) : super(key: key);

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  AppLocalizations? t;

  @override
  Widget build(BuildContext context) {
    return PlatformWidgetBuilder(
      material: (_, child, __) => ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
          child: Card(
            shape: Constants.CARD_SHAPE,
            child: child,
          )),
      cupertino: (_, child, __) => CupertinoButton(
        color: Colors.white,
        padding: EdgeInsets.zero,
        child: child ?? Container(),
        onPressed: () {
          Navigator.pushNamed(context, '/profile');
        },
      ),
      child: StreamBuilder(
        stream: widget.authBloc.user,
        builder: (context, snapshot) {
          User? user = snapshot.data as User?;
          if (user == null) return const SignupButton();
          return Padding(
            padding: Constants.PAGE_PADDING,
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
                      user.name,
                      style: TextStyle(
                          fontSize: Constants.S1_FONT_SIZE,
                          color: Constants.PRIMARY_COLOR,
                          fontWeight: Constants.MEDIUM_FONT_WEIGHT),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
